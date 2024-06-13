using ProjectFinal.Services;

namespace ProjectFinal.Models
{
    public class CartItem
    {
        public int? quantity { set; get; }
        public Product product { set; get; }

        public decimal Accept(ICartVisitor visitor)
        {
            // Đảm bảo giá trị không null
            var quantity = this.quantity ?? 0;
            var price = this.product?.Price ?? 0;
            return visitor.Visit(this, quantity, price);
        }
    }
}
