using ProjectFinal.Models;

namespace ProjectFinal.Services
{
	public class CartTotalVisitor : ICartVisitor
	{
		public decimal Visit(CartItem cartItem, int quantity, decimal price)
		{
			return price * quantity;
		}
	}
}