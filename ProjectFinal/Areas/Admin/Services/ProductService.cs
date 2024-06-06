using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Data;
using ProjectFinal.Models;

public class ProductService : IProductService
{
    private readonly AppDBContext _context;

    public ProductService(AppDBContext context)
    {
        _context = context;
    }

    public async Task<List<Product>> GetProductsAsync()
    {
        return await _context.Products.Include(p => p.Category).ToListAsync();
    }

    public async Task<Product> GetProductByIdAsync(int id)
    {
        return await _context.Products.Include(p => p.Category).FirstOrDefaultAsync(m => m.Id == id);
    }

    public async Task AddProductAsync(Product product)
    {
        _context.Add(product);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateProductAsync(Product product)
    {
        _context.Update(product);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteProductAsync(int id)
    {
        var product = await _context.Products.FindAsync(id);
        if (product != null)
        {
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
        }
    }

    public bool ProductExists(int id)
    {
        return _context.Products.Any(e => e.Id == id);
    }

    public SelectList GetCategoriesSelectList()
    {
        return new SelectList(_context.Categories, "Id", "Name");
    }
}
