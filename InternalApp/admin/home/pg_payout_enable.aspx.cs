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
    public partial class pg_payout_enable : System.Web.UI.Page
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

                if (string.IsNullOrEmpty(txt_mobile_no.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    txt_mobile_no.Focus();
                    return;
                }


                else if (ddl_pg_status.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select PG Status";
                    ddl_pg_status.Focus();
                    return;
                }
                else if (ddl_payout_status.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select Payout Status";
                    ddl_payout_status.Focus();
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("MobileNumber", txt_mobile_no.Text));
                Cmd.Parameters.Add(new SqlParameter("PGEnableStatus", ddl_pg_status.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("PayoutEnableStatus", ddl_payout_status.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));


                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_PGPayoutEnable");
                if (dst != null && dst.Tables.Count > 0)
                {
                    if (dst.Tables[0].Rows[0][0].ToString() == "100")
                    {
                        lblSuccessMessage.Text = "Successfully Updated";

                        clearfields();
                        return;

                        //  Lbl1.Text = "Transaction successful";
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

            txt_mobile_no.Text = "";
            txt_mobile_no.Focus();
            ddl_pg_status.SelectedValue = "0";
            ddl_payout_status.SelectedValue = "0";

        }

        protected void txt_mobile_no_TextChanged(object sender, EventArgs e)
        {
            try
            {


                if (string.IsNullOrEmpty(txt_mobile_no.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    txt_mobile_no.Focus();
                    return;
                }

                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("MOBILENUMBER", txt_mobile_no.Text));

                DataSet dst = MasterDAL.GetDataSet(Cmd, "GET_PGPAYOUTSTATUS");
                if (dst != null && dst.Tables.Count > 0)
                {

                    if (dst.Tables[0].Rows[0][0].ToString() == "101")
                    {
                        lblSuccessMessage.Text = "INVALID MOBILENUMBER";
                        //clearfields();
                        txt_mobile_no.Focus();
                        return;


                    }

                    else
                    {
                        string pg_ststus = dst.Tables[0].Rows[0]["PGSTATUS"].ToString();
                        string payout_status = dst.Tables[0].Rows[0]["PAYOUTSTATUS"].ToString();
                        if (pg_ststus.ToUpper() == "ENABLE")
                        {
                            ddl_pg_status.SelectedValue = "1";
                        }
                        else
                        {
                            ddl_pg_status.SelectedValue = "2";
                        }
                        if (payout_status.ToUpper() == "ENABLE")
                        {
                            ddl_payout_status.SelectedValue = "1";
                        }
                        else
                        {
                            ddl_payout_status.SelectedValue = "2";
                        }
                        return;
                    }

                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}