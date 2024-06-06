using ProjectFinal.Models;

public interface ICategoryService
{
    // Desgin Pattern Bridge
    Task<List<Category>> GetCategoriesAsync();
    Task<Category> GetCategoryByIdAsync(int id);
    Task AddCategoryAsync(Category category);
    Task UpdateCategoryAsync(Category category);
    Task DeleteCategoryAsync(int id);
    bool CategoryExists(int id);
}
