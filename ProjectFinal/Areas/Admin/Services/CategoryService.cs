using Microsoft.EntityFrameworkCore;
using ProjectFinal.Data;
using ProjectFinal.Models;

public class CategoryService : ICategoryService
{
    private readonly AppDBContext _context;

    public CategoryService(AppDBContext context)
    {
        _context = context;
    }

    public async Task<List<Category>> GetCategoriesAsync()
    {
        return await _context.Categories.ToListAsync();
    }

    public async Task<Category> GetCategoryByIdAsync(int id)
    {
        return await _context.Categories.FirstOrDefaultAsync(m => m.Id == id);
    }

    public async Task AddCategoryAsync(Category category)
    {
        _context.Add(category);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateCategoryAsync(Category category)
    {
        _context.Update(category);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteCategoryAsync(int id)
    {
        var category = await _context.Categories.FindAsync(id);
        if (category != null)
        {
            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();
        }
    }

    public bool CategoryExists(int id)
    {
        return _context.Categories.Any(e => e.Id == id);
    }
}

