using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace EShopOnAbp.Shared.Hosting.Middlewares
{
    public class IndexHtmlRedirectMiddleware
    {
        private readonly RequestDelegate _next;

        public IndexHtmlRedirectMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            if (context.Request.Path == "/index.html")
            {
                context.Response.Redirect("/swagger/index.html");
                return;
            }

            await _next(context);
        }
    
    }
}
