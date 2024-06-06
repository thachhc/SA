using Microsoft.AspNetCore.Mvc;
using ProjectFinal.Data;
using ProjectFinal.Models;
using ProjectFinal.Services;
using Microsoft.AspNetCore.Identity;
using System.Linq;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace ProjectFinal.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly AppDBContext _context;
        private readonly CartService _cartService;
        private readonly UserManager<AppUser> _userManager;

        public CheckoutController(AppDBContext context, CartService cartService, UserManager<AppUser> userManager)
        {
            _context = context;
            _cartService = cartService;
            _userManager = userManager;
        }

        [HttpGet]
        [Route("checkout")]
        public IActionResult Checkout(string recipientName, string recipientPhone, string recipientAddress)
        {
            // Lưu thông tin đơn hàng vào TempData để sử dụng
            TempData["RecipientName"] = recipientName;
            TempData["RecipientPhone"] = recipientPhone;
            TempData["RecipientAddress"] = recipientAddress;

            //if (!User.Identity.IsAuthenticated)
            //{
            //    return RedirectToAction("Login", "User");
            //}

            // Người dùng đã đăng nhập, tiếp tục xử lý thông tin đơn hàng
            var cart = _cartService.GetCartItems(HttpContext);
            var viewModel = new CheckoutViewModel
            {
                CartItems = cart,
                RecipientInfo = new RecipientInformation
                {
                    RecipientName = recipientName,
                    RecipientPhone = recipientPhone,
                    RecipientAddress = recipientAddress
                }
            };

            return View(viewModel);
        }

        [HttpPost]
        [Route("checkout")]
       // [Authorize]
        public async Task<IActionResult> Checkout()
        {
            if (!User.Identity.IsAuthenticated)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Login", "User");
            }

            // Người dùng đã đăng nhập, tiếp tục xử lý thông tin đơn hàng
            var cart = _cartService.GetCartItems(HttpContext);

            // Lấy thông tin đơn hàng từ TempData 
            var recipientName = TempData["RecipientName"]?.ToString();
            var recipientPhone = TempData["RecipientPhone"]?.ToString();
            var recipientAddress = TempData["RecipientAddress"]?.ToString();

            if (string.IsNullOrEmpty(recipientName) || string.IsNullOrEmpty(recipientPhone) || string.IsNullOrEmpty(recipientAddress))
            {
                return RedirectToAction("Cart", "Cart"); // Redirect back to the cart
            }

            // Lấy thông tin người dùng từ UserManager
            var user = await _userManager.GetUserAsync(User);

            // Lưu thông tin đơn hàng vào database
            var order = new Order
            {
                UserId = user.Id,
                Status = "Pending", // Trạng thái đơn hàng
                CreatedAt = DateTime.Now,
                RecipientName = recipientName,
                RecipientPhone = recipientPhone,
                RecipientAddress = recipientAddress,
                OrderProducts = cart.Select(item => new OrderProduct
                {
                    ProductId = item.product.Id,
                    Quantity = item.quantity,
                    Price = item.product.Price,
                    Total = item.quantity * item.product.Price
                }).ToList(),
            };

            order.TotalAmount = order.OrderProducts.Sum(s => s.Total);


            // Lưu đơn hàng vào database
            _context.Orders.Add(order);
            _context.SaveChanges();

            // Xóa thông tin đơn hàng đã lưu trong TempData
            TempData.Remove("RecipientName");
            TempData.Remove("RecipientPhone");
            TempData.Remove("RecipientAddress");

            // Xóa giỏ hàng
            _cartService.ClearCart(HttpContext);

            // Set PaymentSuccess based on your payment logic
            var viewModel = new CheckoutViewModel
            {
                CartItems = cart,
                RecipientInfo = new RecipientInformation
                {
                    RecipientName = recipientName,
                    RecipientPhone = recipientPhone,
                    RecipientAddress = recipientAddress
                },
                PaymentSuccess = true // Modify this based on your payment logic
            };

            return View(viewModel);
        }
    }
}
