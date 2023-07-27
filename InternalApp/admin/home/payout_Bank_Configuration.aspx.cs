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
    public partial class payout_Bank_Configuration : System.Web.UI.Page
    {
        datasource ds = new datasource();
        VDALSQL MasterDAL = new VDALSQL(ConfigurationSettings.AppSettings["MasterDAL"].ToString());
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
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
                dst = ds.get_pg_bank();
                if (dst != null && dst.Tables[0].Rows.Count > 0)
                {

                    lblimpsbank.Text = dst.Tables[0].Rows[0]["IMPSBANK"].ToString();
                    lblneftbank.Text = dst.Tables[0].Rows[0]["NEFTBANK"].ToString();
                    lblrtgsbank.Text = dst.Tables[0].Rows[0]["RTGSBANK"].ToString();
                    ddl_imps_mode.SelectedValue = "0";
                    ddl_neft_mode.SelectedValue = "0";
                    ddl_rdgs_mode.SelectedValue = "0";

                    //if (lblimpsbank.Text == "Yes Bank")
                    //{
                    //    ddl_imps_mode.SelectedValue = "4";
                    //}
                    //else
                    //{
                    //    ddl_imps_mode.SelectedValue = "3";
                    //}
                    //if (lblneftbank.Text == "Yes Bank")

                    //{
                    //    ddl_neft_mode.SelectedValue = "4";
                    //}
                    //else
                    //{
                    //    ddl_neft_mode.SelectedValue = "3";
                    //}
                    //if (lblrtgsbank.Text == "Yes Bank")

                    //{
                    //    ddl_rdgs_mode.SelectedValue = "4";
                    //}
                    //else
                    //{
                    //    ddl_rdgs_mode.SelectedValue = "3";
                    //}
                }
                else
                {

                    lblimpsbank.Text = "";
                    lblneftbank.Text = "";
                    lblrtgsbank.Text = "";
                    ddl_imps_mode.SelectedValue = "0";
                    ddl_neft_mode.SelectedValue = "0";
                    ddl_rdgs_mode.SelectedValue = "0";
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



                if (ddl_imps_mode.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select IMPS Bank";
                    ddl_imps_mode.Focus();
                    return;
                }
                else if (ddl_neft_mode.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select NEFT Bank";
                    ddl_neft_mode.Focus();
                    return;
                }
                else if (ddl_rdgs_mode.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select RTGS Bank";
                    ddl_rdgs_mode.Focus();
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("IMPSBANK", ddl_imps_mode.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("NEFTBANK", ddl_neft_mode.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("RTGSBANK", ddl_rdgs_mode.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("createdby", Convert.ToInt32(Session["user_ref_id"].ToString())));


                DataSet dst = TransDAL.GetDataSet(Cmd, "INSPayoutBankMaster");
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