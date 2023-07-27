using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InternalApp
{
    public partial class session_expired : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Session["sid"] = "";
            //Session["token_id"] = "";
            //Session["session_id"] = "";
            //Session["sys_IP"] = "";
            //Session["mac_id"] = "";
            //Session["user_ref_id"] = "";
            //Session["first_name"] = "";

            //Session["last_name"] = "";
            //Session["usergroup_ref_id"] = "";
            //Session["dob"] = "";
            //Session["active_status"] = "";
        }

        protected void btn_redirect_Click(object sender, EventArgs e)
        {
          //  Response.Redirect("https://localhost:44319/admin/home/login.aspx?LGT=1");
        }
    }
}