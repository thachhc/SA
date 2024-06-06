using ProjectFinal.Data;

namespace ProjectFinal.Services
{
    public class AppUserFactory :IAppUserFactory
    {
        public AppUser Create()
        {
            return new AppUser();
        }
    }
}
