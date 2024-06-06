using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Data;

namespace ProjectFinal.Components
{
	public class CategoryViewComponent: ViewComponent
	{
		private readonly AppDBContext _dbContext;
		public CategoryViewComponent(AppDBContext dbContext) 
		{
			_dbContext = dbContext;
		}
		public async Task<IViewComponentResult> InvokeAsync()
		{
			var CateList = await _dbContext.Categories.Take(7).ToListAsync();
			return View(CateList);
		}
	}
}
