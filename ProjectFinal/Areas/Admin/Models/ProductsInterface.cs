using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectFinal.Models;

public interface IProductService
{
    Task<List<Product>> GetProductsAsync();
    Task<Product> GetProductByIdAsync(int id);
    Task AddProductAsync(Product product);
    Task UpdateProductAsync(Product product);
    Task DeleteProductAsync(int id);
    bool ProductExists(int id);
    SelectList GetCategoriesSelectList();
}
