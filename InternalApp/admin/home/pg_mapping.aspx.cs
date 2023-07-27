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
using System.Security.Cryptography;

namespace InternalApp.admin.home
{
    public partial class pg_mapping : System.Web.UI.Page
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
                bindgrid();
            }

        }
        void bindgrid()
        {
            try
            {
                DataSet dst = new DataSet();
                dst = ds.get_pg_link_bank();
                if (dst != null && dst.Tables[0].Rows.Count > 0)
                {

                    txt_PG_Link_Value.Text = dst.Tables[0].Rows[0]["PGLINK"].ToString();
                    txt_PG_Link_Value1.Text = dst.Tables[0].Rows[0]["PGLINK1"].ToString();
                    txt_PG_Link_Value2.Text = dst.Tables[0].Rows[0]["PGLINK2"].ToString();
                    txt_PG_Link_Value3.Text = dst.Tables[0].Rows[0]["PGLINK3"].ToString();

                    if (txt_PG_Link_Value.Text.ToUpper() == "RAZORPAY")
                    {
                        ddl_pg_link.SelectedValue = "2";
                    }
                    else if (txt_PG_Link_Value.Text.ToUpper() == "CASHFREE")
                    {
                        ddl_pg_link.SelectedValue = "7";
                    }
                    else if (txt_PG_Link_Value.Text.ToUpper() == "PAYTM")
                    {
                        ddl_pg_link.SelectedValue = "1";
                    }
                    else
                    {
                        ddl_pg_link.SelectedValue = "11";
                    }
                    if (txt_PG_Link_Value1.Text.ToUpper() == "RAZORPAY")

                    {
                        ddl_pg_link1.SelectedValue = "2";
                    }
                    else if (txt_PG_Link_Value1.Text.ToUpper() == "CASHFREE")
                    {
                        ddl_pg_link1.SelectedValue = "7";
                    }
                    else if (txt_PG_Link_Value1.Text.ToUpper() == "PAYTM")
                    {
                        ddl_pg_link1.SelectedValue = "1";
                    }
                    else
                    {
                        ddl_pg_link1.SelectedValue = "11";
                    }
                    if (txt_PG_Link_Value2.Text.ToUpper() == "RAZORPAY")

                    {
                        ddl_pg_link2.SelectedValue = "2";
                    }
                    else if (txt_PG_Link_Value2.Text.ToUpper() == "CASHFREE")
                    {
                        ddl_pg_link2.SelectedValue = "7";
                    }
                    else if (txt_PG_Link_Value2.Text.ToUpper() == "PAYTM")
                    {
                        ddl_pg_link2.SelectedValue = "1";
                    }
                    else
                    {
                        ddl_pg_link2.SelectedValue = "11";
                    }

                    if (txt_PG_Link_Value3.Text.ToUpper() == "RAZORPAY")

                    {
                        ddl_pg_link3.SelectedValue = "2";
                    }
                    else if (txt_PG_Link_Value3.Text.ToUpper() == "CASHFREE")
                    {
                        ddl_pg_link3.SelectedValue = "7";
                    }
                    else if (txt_PG_Link_Value3.Text.ToUpper() == "PAYTM")
                    {
                        ddl_pg_link3.SelectedValue = "1";
                    }
                    else
                    {
                        ddl_pg_link3.SelectedValue = "11";
                    }
                }
                else
                {

                    txt_PG_Link_Value.Text = "";
                    txt_PG_Link_Value1.Text = "";
                    txt_PG_Link_Value2.Text = "";
                    txt_PG_Link_Value3.Text = "";
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {



                if (ddl_pg_link.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select PG Link";
                    ddl_pg_link.Focus();
                    return;
                }
                else if (ddl_pg_link1.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select PG Link1";
                    ddl_pg_link1.Focus();
                    return;
                }
                else if (ddl_pg_link2.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select PG Link2";
                    ddl_pg_link2.Focus();
                    return;
                }
                else if (ddl_pg_link3.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select PG Link3";
                    ddl_pg_link3.Focus();
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("PGLINK", ddl_pg_link.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("PGLINK1", ddl_pg_link1.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("PGLINK2", ddl_pg_link2.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("PGLINK3", ddl_pg_link3.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("pdatedby", Session["user_ref_id"].ToString()));


                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_UPDATEPGBANK");
                if (dst != null && dst.Tables.Count > 0)
                {
                    if (dst.Tables[0].Rows[0][0].ToString() == "100")
                    {
                        lblSuccessMessage.Text = "Successfully Updated";
                        // clearfields();
                        bindgrid();
                        return;

                        //  Lbl1.Text = "Transaction successful";
                    }

                    else
                    {
                        lblErrorMessage.Text = dst.Tables[0].Rows[0]["RESPONCEDESC"].ToString();
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
            //txt_mobile_no.Text = "";

            //ddl_pg_status.SelectedValue = "0";
            //ddl_payout_status.SelectedValue = "0";

        }

    }
}