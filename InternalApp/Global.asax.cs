using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace InternalApp
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

        }
        //protected void Application_Error(object sender, EventArgs e)
        //{
        //Exception exception = Server.GetLastError();
        //Response.Clear();

        //HttpException httpException = exception as HttpException;

        //if (httpException != null)
        //{

        //    switch (httpException.GetHttpCode())
        //    {
        //        case 404:
        //            // page not found 
        //            //Response.Redirect("/session_expired.aspx");
        //            break;
        //        case 500:
        //            // server error 
        //         //   routeData.Values.Add("action", "HttpError500");
        //            break;
        //        default:
        //            //routeData.Values.Add("action", "General");
        //            break;
        //    }



        //    // clear error on server 
        //    Server.ClearError();

        //}
        // }
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //try
            //{
            //    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
            //    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");
            //}
            //catch (Exception ex) { }
            try
            {
                HttpContext.Current.Response.AddHeader("X-Frame-Options", "SAMEORIGIN");
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate,pre-check=0,post-check=0,s-maxage=0");
                Response.AddHeader("X-XSS-Protection", "1; mode=block");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
                Response.Cache.SetNoStore();
                Response.Cache.AppendCacheExtension("no-cache, no-store, max-age=0, must-revalidate,pre-check=0,post-check=0,s-maxage=0");
                Response.AppendHeader("Pragma", "no-cache");
                Response.AppendHeader("Expires", "0");
            }
            catch (Exception ex) 
            {

            }
        }
    }
}