using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Data;
using ProjectFinal.Models;
using System.Diagnostics;

namespace ProjectFinal.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AppDBContext _Context;

        public HomeController(ILogger<HomeController> logger, AppDBContext context)
        {
            _logger = logger;
            _Context = context;
        }

        public IActionResult Index()
        {
            List<Product> products = this._Context.Products.Take(6).ToList();
			List<Product> p = this._Context.Products.ToList();

			List<Category> categories = this._Context.Categories.ToList();
			List<Category> filteredCategories = categories.Where(c => c.Id >= 16 && c.Id <= 20).ToList();
			
            ViewBag.Products = p;
			ViewBag.Categories = filteredCategories;
            ViewBag.FirstCategory = filteredCategories.FirstOrDefault();


            return View(products);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}