using System.ComponentModel.DataAnnotations;

namespace ProjectFinal.Models
{
	public class RegisterViewModel
	{
		[Display(Name = "First Name")]
		public string? FirstName { get; set; }

		[Display(Name = "Last Name")]
		public string? LastName { get; set; }

        [Display(Name = "Address")]
        public string? Address { get; set; }

        //[Required]
        [Required(ErrorMessage = "Phone number is required.")]
        [RegularExpression(@"^\s*(0\d{9}|84\d{9})\s*$", ErrorMessage = "Invalid phone number format.")]
        [Display(Name = "Phone Number")]
        public string? PhoneNumber { get; set; }

        [Required]
		[EmailAddress]
		[Display(Name = "Email")]
		public string? Email { get; set; }

		[Required]
		[StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
		[DataType(DataType.Password)]
		[Display(Name = "Password")]
		public string? Password { get; set; }


		[DataType(DataType.Password)]
		[Display(Name = "Confirm password")]
		[Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
		public string? ConfirmPassword { get; set; }

	}
}
