using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ProjectFinal.Data;
using ProjectFinal.Services;
var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("WebDB") ?? throw new InvalidOperationException("Connection string 'IdentityContextConnection' not found.");

builder.Services.AddDbContext<IdentityContext>(options =>
	options.UseSqlServer(connectionString));

builder.Services.AddDbContext<AppDBContext>(options =>
	options.UseSqlServer(connectionString));

builder.Services.AddDefaultIdentity<AppUser>(options => options.SignIn.RequireConfirmedAccount = false)
	.AddEntityFrameworkStores<AppDBContext>();



// Design Pattern Facatory
builder.Services.AddScoped<IAppUserFactory, AppUserFactory>();



// Add services to the container.
builder.Services.AddControllersWithViews();


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDistributedMemoryCache();       // Đăng ký dịch vụ lưu cache trong bộ nhớ (Session sẽ sử dụng nó)
builder.Services.AddSession(cfg =>
{               // Đăng ký dịch vụ Session
	cfg.Cookie.Name = "phta";                    // Đặt tên Session - tên này sử dụng ở Browser (Cookie)
	cfg.IdleTimeout = new TimeSpan(0, 30, 0);    // Thời gian tồn tại của Session, nếu không có hoạt động nào từ người dùng trong khoảng thời gian này, Session sẽ hết hiệu lực.
});
builder.Services.AddScoped<CartService>(); //mỗi lần một yêu cầu HTTP mới được xử lý, một đối tượng mới của CartService sẽ được tạo và sử dụng



var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Home/Error");
	app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseSession(); // Đăng ký Middleware Session vào Pipeline

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
