using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VDAL;

namespace InternalApp.admin.home
{
    public partial class app_alert_Message : System.Web.UI.Page
    {
        datasource ds = new datasource();       
        VDALSQL MasterDAL = new VDALSQL(ConfigurationSettings.AppSettings["MasterDAL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

            Header1.ValidateSession();
            //StatusDivFail.Visible = false;
            //StatusDivSuccess.Visible = false;   
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";
            if (!IsPostBack)

            {

            }

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrEmpty(txt_msg.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Message";
                    txt_msg.Focus();
                    return;
                }
               
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("ScrollMessage", txt_msg.Text));               
                Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));
                DataSet dst = MasterDAL.GetDataSet(Cmd, "Apt_UpdateScrollMessage");
                if (dst != null && dst.Tables.Count > 0)
                {
                    if (dst.Tables[0].Rows[0][0].ToString() == "100")
                    {
                        lblSuccessMessage.Text = "Successfully Updated";
                        clearfields();
                        return;
                    }

                    else
                    {
                        lblErrorMessage.Text = dst.Tables[0].Rows[0]["ResponseDescription"].ToString();
                        return;
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Please Try Later";
                    return;
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Unable to Procss, Please Try Later";
                return;
            }
        }

        void clearfields()
        {
            txt_msg.Text = "";
           txt_msg.Focus();

        }
        
    }
}