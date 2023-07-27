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
    public partial class topup_reversal : System.Web.UI.Page
    {
        datasource ds = new datasource();
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

            Header1.ValidateSession();
            //StatusDivFail.Visible = false;
            //StatusDivSuccess.Visible = false;   
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";

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

                else if (string.IsNullOrEmpty(txt_trans_id.Text))

                {
                    lblErrorMessage.Text = "Enter a Valid Bank Transaction ID";
                    txt_trans_id.Focus();
                    return;
                }

                if (txt_Amt.Text == "" || txt_Amt.Text == "0" || Convert.ToDecimal(txt_Amt.Text) < 0)
                {
                    lblErrorMessage.Text = "Enter a Valid Amount";
                    txt_Amt.Focus();
                    return;
                }
                if (string.IsNullOrEmpty(txt_remarks.Text))

                {
                    lblErrorMessage.Text = "Enter a Valid Bank Transaction ID";
                    txt_remarks.Focus();
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("TransactionID", txt_trans_id.Text));
                Cmd.Parameters.Add(new SqlParameter("AmountRemarks", txt_remarks.Text));
                Cmd.Parameters.Add(new SqlParameter("Amount", Convert.ToDecimal(txt_Amt.Text)));
                Cmd.Parameters.Add(new SqlParameter("Mobilenumber", txt_mobile_no.Text));
                Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));

                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_Chargeback");

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
            txt_mobile_no.Focus();
            txt_mobile_no.Text = "";
            txt_trans_id.Text = "";
            txt_Amt.Text = "";
            txt_remarks.Text = "";
            lbl_agency_name.Text = "";
            lbl_balance.Text = "";
        }

        protected void txt_mobile_no_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //StatusDivFail.Visible = false;
                //StatusDivSuccess.Visible = false;
                // Session["text_nobile_no"]
                // txt_merchant_type.Text = "";
                lbl_agency_name.Text = "";
                lbl_balance.Text = "";
                // ddl_bank.SelectedValue = "0";
                // DDLTopUpType.SelectedValue = "0";
                txt_trans_id.Text = "";
                txt_Amt.Text = "";
                txt_remarks.Text = "";

                merchant_info_resp merchant_info_resp = new merchant_info_resp();

                if (txt_mobile_no.Text == "")
                {
                    lblErrorMessage.Text = "Please Enter Valid Mobile Number";
                    return;
                }

                merchant_info_resp = ds.Merchant_info(txt_mobile_no.Text);

                if (merchant_info_resp.response_code == "0")
                {
                    ////if (merchant_info_resp.account_type_ref_id == "2")
                    ////{
                    ////    txt_merchant_type.Text = "Distributor";
                    ////}
                    ////else if (merchant_info_resp.account_type_ref_id == "3")
                    ////{

                    ////    txt_merchant_type.Text = "Retailer";

                    ////}
                    ////else
                    ////{
                    ////    txt_merchant_type.Text = "";

                    ////}
                    lbl_agency_name.Text = merchant_info_resp.agency_name;
                    lbl_balance.Text = merchant_info_resp.current_balance;
                    // StatusDivFail.Visible = false;
                }
                else
                {
                    lblErrorMessage.Text = merchant_info_resp.response_description;
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}