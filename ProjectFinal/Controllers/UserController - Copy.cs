//using Microsoft.AspNetCore.Identity.UI.Services;
//using Microsoft.AspNetCore.Identity;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.WebUtilities;
//using ProjectFinal.Models;
//using System.Text.Encodings.Web;
//using System.Text;
//using ProjectFinal.Data;

//namespace ProjectFinal.Controllers
//{
//	public class UserController : Controller
//	{
//		private readonly SignInManager<AppUser> _signInManager;
//		private readonly UserManager<AppUser> _userManager;
//		private readonly AppDBContext _Context;

//		public UserController(AppDBContext context, 
//			SignInManager<AppUser> signInManager, 
//			UserManager<AppUser> userManager)
//		{
//			_Context = context;
//			_signInManager = signInManager;
//			_userManager = userManager;
//		}

//		public IActionResult Index()
//		{
//			return View();
//		}

//        public IActionResult Register()
//		{
//			return View();
//		}

//		[HttpPost]
//		public async Task<IActionResult> Register(RegisterViewModel usermodel)
//		{
//			string returnUrl = ""; // Url.Content("~/");
//								   //ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
//			if (ModelState.IsValid)
//			{
//				var user = CreateUser();
//				user.FirstName = usermodel.FirstName;
//				user.LastName = usermodel.LastName;
//				user.Address = usermodel.Address;
//				user.PhoneNumber = usermodel.PhoneNumber;
//				user.UserName = usermodel.Email;
//                user.Email = usermodel.Email;

//                var result = await _userManager.CreateAsync(user, usermodel.Password);

//				if (result.Succeeded)
//				{
//					if (_userManager.Options.SignIn.RequireConfirmedAccount)
//					{
//						return RedirectToPage("RegisterConfirmation", new { email = usermodel.Email, returnUrl = returnUrl });
//					}
//					else
//					{
//						await _signInManager.SignInAsync(user, isPersistent: false);
//						return RedirectToAction("Index", "Home");
//					}
//				}
//				foreach (var error in result.Errors)
//				{
//					ModelState.AddModelError(string.Empty, error.Description);
//				}
//				return View();
//			}
//			return View();
//		}


//		public AppUser CreateUser()
//		{
//			try
//			{
//				return Activator.CreateInstance<AppUser>();
//			}
//			catch
//			{
//				throw new InvalidOperationException($"Can't create an instance of '{nameof(AppUser)}'. " +
//					$"Ensure that '{nameof(AppUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
//					$"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
//			}
//		}

//        public IActionResult Login()
//        {
//            return View();
//        }

//		[HttpPost]
//        public async Task<IActionResult> Login(LoginViewModel model)
//        {
//			string returnUrl = ""; // Url.Content("~/");

//            if (ModelState.IsValid)
//            {
//                // This doesn't count login failures towards account lockout
//                // To enable password failures to trigger account lockout, set lockoutOnFailure: true
//                var result = await _signInManager.PasswordSignInAsync(model.Email, model.Password, false, lockoutOnFailure: false);
//                if (result.Succeeded)
//                {
//                    return RedirectToAction("Index", "Home");
//                }
//				else if (result.Succeeded == false)
//                {
//                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
//                    return View();
//                }
//            }
//            return View();
//        }

//        public async Task<IActionResult> Logout(string returnUrl)
//        {
//            await _signInManager.SignOutAsync();
//            return LocalRedirect(returnUrl);
//        }
//    }
//}
