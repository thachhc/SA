using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Data;
using ProjectFinal.Services;  // Ensure you have the correct namespace for your services

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("WebDB") ?? throw new InvalidOperationException("Connection string 'IdentityContextConnection' not found.");

builder.Services.AddDbContext<IdentityContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddDbContext<AppDBContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddDefaultIdentity<AppUser>(options => options.SignIn.RequireConfirmedAccount = false)
    .AddEntityFrameworkStores<AppDBContext>();

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDistributedMemoryCache();       // Register in-memory cache for session
builder.Services.AddSession(cfg =>
{   // Register session
    cfg.Cookie.Name = "phta";                    // Set session cookie name
    cfg.IdleTimeout = new TimeSpan(0, 30, 0);    // Set session timeout duration
});

// Register the services
builder.Services.AddScoped<CartService>(); // Register CartService
builder.Services.AddScoped<IProductService, ProductService>(); // Register ProductService
builder.Services.AddScoped<ICategoryService, CategoryService>(); // Register CategoryService

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseSession(); // Register session middleware in the pipeline

app.UseRouting();
app.UseAuthentication(); 

app.UseAuthorization();
app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapRazorPages();

app.Run();
