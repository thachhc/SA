using Newtonsoft.Json;
using ProjectFinal.Models;

namespace ProjectFinal.Services
{
    public class CartService
    {
        // Key lưu chuỗi json của Cart
        public const string CARTKEY = "cart";

        // Lấy cart từ Session (danh sách CartItem)
        public List<CartItem> GetCartItems(HttpContext context)
        {
            string jsoncart = context.Session.GetString(CARTKEY);
            if (jsoncart != null)
            {
                return JsonConvert.DeserializeObject<List<CartItem>>(jsoncart); //chuyển đổi chuỗi JSON thành một danh sách các đối tượng CartItem.
            }
            return new List<CartItem>();
        }

        // Xóa cart khỏi session
        public void ClearCart(HttpContext context)
        {
            context.Session.Remove(CARTKEY);
        }

        // Lưu Cart (Danh sách CartItem) vào session
        public void SaveCartSession(HttpContext context, List<CartItem> cartItems)
        {
            string jsoncart = JsonConvert.SerializeObject(cartItems);
            context.Session.SetString(CARTKEY, jsoncart);
        }
        public decimal CalculateTotal(List<CartItem> cart)
        {
            ICartVisitor visitor = new CartTotalVisitor();
            return cart.Sum(item => item.Accept(visitor));
        }

        public decimal CalculateSubtotal(CartItem cartItem)
        {
            ICartVisitor visitor = new CartTotalVisitor();
            return cartItem.Accept(visitor);
        }
    }
}
