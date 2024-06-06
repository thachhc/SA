using Microsoft.AspNetCore.Mvc;
using ProjectFinal.Data;
using ProjectFinal.Models;

namespace ProjectFinal.Controllers
{
	public class ProductController : Controller
	{
		private readonly AppDBContext _Context;

		public ProductController(AppDBContext context)
		{
			_Context = context;
		}

		public IActionResult Index()
		{
			return View();
		}

		public IActionResult Detail(int id)
		{
			var p = this._Context.Products.Where(p => p.Id == id).FirstOrDefault();
            return View(p);
		}

		public IActionResult DetailCategory(int Id)
		{
			var p = this._Context.Products.Where(p => p.CategoryId == Id).ToList();
			return View(p);
		}
    }
}
