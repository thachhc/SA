namespace ProjectFinal.Models
{
    public class CheckoutViewModel
    {
        public List<CartItem> CartItems { get; set; }
        public RecipientInformation RecipientInfo { get; set; }
        public bool PaymentSuccess { get; set; }
    }
}
