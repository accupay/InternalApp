using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InternalApp.admin.home
{
    public partial class Manage_user : System.Web.UI.Page
    {
        datasource ds = new datasource();
        public DataSet ds_manage_user = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
           Header1.ValidateSession();
            Showgrd();
        }
        void Showgrd()
        {
            try
            {

                ds_manage_user = ds.manage_users();

                //grd_manage_user.Visible = true;
                //grd_manage_user.DataSource = dst;
                //grd_manage_user.DataBind();
            }
            catch (Exception ex)
            {
                

            }

        }
    }
}