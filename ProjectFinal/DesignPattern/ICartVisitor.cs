using ProjectFinal.Models;

namespace ProjectFinal.Services
{
	public interface ICartVisitor
	{
		decimal Visit(CartItem cartItem, int quantity, decimal price);
	}
}