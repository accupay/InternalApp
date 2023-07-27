using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Util;
using System.Configuration;
using VDAL;
using System.Linq.Expressions;
using System.Security.Cryptography;

namespace InternalApp.admin.home
{
    public partial class manual_topup : System.Web.UI.Page
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
            if (!IsPostBack)

            {
                SqlCommand bank = new SqlCommand();
                ddl_bank.DataSource = ds.get_bank_list();
                ddl_bank.DataValueField = "BankRefID";
                ddl_bank.DataTextField = "Name";
                ddl_bank.DataBind();
                ddl_bank.Items.Insert(0, new ListItem("Select a Bank", "0"));

                SqlCommand Type = new SqlCommand();
                DDLTopUpType.DataSource = ds.topup_type();
                DDLTopUpType.DataValueField = "TopUpTypeRefID";
                DDLTopUpType.DataTextField = "TopUpType";
                DDLTopUpType.DataBind();
                DDLTopUpType.Items.Insert(0, new ListItem("Select Topup Type", "0"));
            }

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrEmpty(txt_mobile_no.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    return;
                }
                else if (string.IsNullOrEmpty(txt_merchant_type.Text))

                {
                    lblErrorMessage.Text = "Invalid Merchant Type";
                    return;
                }
                else if (string.IsNullOrEmpty(txt_agency_name.Text))

                {
                    lblErrorMessage.Text = "Invalid Agency Name";
                    return;
                }
                else if (ddl_bank.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select Bank";
                    return;
                }
                else if (DDLTopUpType.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select Topup Type";
                    return;
                }
                else if (string.IsNullOrEmpty(txt_trans_id.Text))

                {
                    lblErrorMessage.Text = "Enter a Valid Bank Transaction ID";
                    return;
                }

                if (txt_Amt.Text == "" || txt_Amt.Text == "0" || Convert.ToDecimal(txt_Amt.Text) < 0)
                {
                    lblErrorMessage.Text = "Enter a Valid Amount";
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("MobileNo", txt_mobile_no.Text));
                Cmd.Parameters.Add(new SqlParameter("TopupModeRefID", DDLTopUpType.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("DepositSlipRefID", "0"));
                Cmd.Parameters.Add(new SqlParameter("BankRefID", ddl_bank.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("UTRNo", txt_trans_id.Text));
                Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));
                Cmd.Parameters.Add(new SqlParameter("TransDate", ""));
                Cmd.Parameters.Add(new SqlParameter("Amount", txt_Amt.Text));
                Cmd.Parameters.Add(new SqlParameter("TransactionID", ""));
                Cmd.Parameters.Add(new SqlParameter("Remarks", txt_remarks.Text));
                Cmd.Parameters.Add(new SqlParameter("CardRefID", "0"));
                Cmd.Parameters.Add(new SqlParameter("CardSubTypeRefID", "0"));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_TopUpDistributor");

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
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Unable to Procss, Please Try Later";
                return;
            }
        }

        protected void txt_mobile_no_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //StatusDivFail.Visible = false;
                //StatusDivSuccess.Visible = false;
                // Session["text_nobile_no"]
                txt_merchant_type.Text = "";
                txt_agency_name.Text = "";
                lbl_balance.Text = "";
                ddl_bank.SelectedValue = "0";
                DDLTopUpType.SelectedValue = "0";
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
                    if (merchant_info_resp.account_type_ref_id == "2")
                    {
                        txt_merchant_type.Text = "Distributor";
                    }
                    else if (merchant_info_resp.account_type_ref_id == "3")
                    {

                        txt_merchant_type.Text = "Retailer";

                    }
                    else
                    {
                        txt_merchant_type.Text = "";

                    }
                    txt_agency_name.Text = merchant_info_resp.agency_name;
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
        void clearfields()
        {
            txt_mobile_no.Text = "";
            txt_merchant_type.Text = "";
            txt_agency_name.Text = "";
            lbl_balance.Text = "";
            ddl_bank.SelectedValue = "0";
            DDLTopUpType.SelectedValue = "0";
            txt_trans_id.Text = "";
            txt_Amt.Text = "";
            txt_remarks.Text = "";
        }
        //void clearMsgbox()
        //{
        //    StatusDivFail.Visible = false;
        //    StatusDivSuccess.Visible = false;
        //}
        //void lblSuccessMessage.Text =string MSG)
        //{
        //    LblSuccessStatus.Text = MSG;
        //    StatusDivFail.Visible = false;
        //    StatusDivSuccess.Visible = true;
        //}
        //void lblErrorMessage.Text =string MSG)
        //{
        //    LblFailStatus.Text = MSG;
        //    StatusDivFail.Visible = true;
        //    StatusDivSuccess.Visible = false;
        //}
    }
}