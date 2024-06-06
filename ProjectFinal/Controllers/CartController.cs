using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using Newtonsoft.Json;
using ProjectFinal.Data;
using ProjectFinal.Models;
using ProjectFinal.Services;
using System;

namespace ProjectFinal.Controllers
{
    public class CartController : Controller
    {
        private readonly AppDBContext _Context;
        private readonly CartService _cartService;

        public CartController(AppDBContext context, CartService cartService)
        {
            _Context = context;
            _cartService = cartService;
        }

        /// Thêm sản phẩm vào cart
        [Route("addcart/{id:int}", Name = "addcart")]
        public IActionResult AddToCart([FromRoute] int id)
        {
            var product = _Context.Products
                .Where(p => p.Id == id)
                .FirstOrDefault();
            if (product == null)
                return NotFound("Không có sản phẩm");

            // Xử lý đưa vào Cart ...
            var cart = _cartService.GetCartItems(HttpContext);
            var cartitem = cart.Find(p => p.product.Id == id);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cartitem.quantity++;
            }
            else
            {
                //  Thêm mới
                cart.Add(new CartItem() { quantity = 1, product = product });
            }

            // Lưu cart vào Session
            _cartService.SaveCartSession(HttpContext, cart);

            var uniqueProductCount = cart.GroupBy(item => item.product.Id).Count();

            // Trả về thông tin giỏ hàng
            // Trả về một đối tượng JSON chứa số lượng loại sản phẩm và số lượng sản phẩm trong giỏ hàng
            return Json(new
            {
                success = true,
                uniqueProductCount = uniqueProductCount
            });
        }


        // Hiện thị giỏ hàng
        [Route("/cart", Name = "cart")]
        public IActionResult Cart()
        {
            return View(_cartService.GetCartItems(HttpContext));
        }


        /// Cập nhật
        [Route("/updatecart", Name = "updatecart")]
        [HttpPost]
        public IActionResult UpdateCart([FromForm] int id, [FromForm] int quantity)
        {
            // Cập nhật Cart thay đổi số lượng quantity ...
            var cart = _cartService.GetCartItems(HttpContext);
            var cartitem = cart.Find(p => p.product.Id == id);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cartitem.quantity = quantity;
            }
            _cartService.SaveCartSession(HttpContext, cart);
            // Trả về mã thành công (không có nội dung gì - chỉ để Ajax gọi)
            return Json(new
            {
                success = true,
                total = CalculateTotal(cart),
                subtotal = CalculateSubtotal(cartitem)
            });
        }

        private decimal CalculateTotal(List<CartItem> cart)
        {
            return (decimal)cart.Sum(item => item.product.Price * item.quantity);
        }

        private decimal CalculateSubtotal(CartItem cartitem)
        {
            return (decimal)(cartitem.product.Price * cartitem.quantity);
        }

        /// xóa item trong cart
        [Route("/removecart/{id:int}", Name = "removecart")]
        public IActionResult RemoveCart([FromRoute] int id)
        {
            var cart = _cartService.GetCartItems(HttpContext);
            var cartitem = cart.Find(p => p.product.Id == id);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cart.Remove(cartitem);
            }

            _cartService.SaveCartSession(HttpContext, cart);

            var uniqueProductCount = cart.GroupBy(item => item.product.Id).Count();

            // Return a JSON response with updated total
            return Json(new
            {
                success = true,
                total = CalculateTotal(cart),
                uniqueProductCount = uniqueProductCount
            });
        }
    }
}
