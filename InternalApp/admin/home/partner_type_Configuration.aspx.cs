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
    public partial class partner_type_Configuration : System.Web.UI.Page
    {
        datasource ds = new datasource();
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
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
                    return;
                }
                else if (string.IsNullOrEmpty(txt_merchant_name.Text))

                {
                    lblErrorMessage.Text = "Invalid Retailer Name";
                    return;
                }

                else if (ddl_partner_type.SelectedValue.ToString() == "0")

                {
                    lblErrorMessage.Text = "Please Select Partner Type";
                    return;
                }
                if (string.IsNullOrEmpty(txt_ret_mob_no.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("MobileNumber", txt_ret_mob_no.Text));
                Cmd.Parameters.Add(new SqlParameter("PartnerType", ddl_partner_type.SelectedValue));
                Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));


                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_UpdateRetailerPartnerType");

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
                txt_merchant_name.Text = "";
                txt_partner_type.Text = "";

                ddl_partner_type.SelectedValue = "0";


                partner_type_resp PType_Resp = new partner_type_resp();

                if (txt_mobile_no.Text == "")
                {
                    lblErrorMessage.Text = "Please Enter Valid Mobile Number";
                    return;
                }

                PType_Resp = ds.partner_type_config(txt_mobile_no.Text);

                if (PType_Resp.response_code == "0")
                {

                    txt_merchant_name.Text = PType_Resp.retailer_name;
                    txt_ret_mob_no.Text = PType_Resp.mobile_number;
                    txt_partner_type.Text = PType_Resp.partner_description;
                    // StatusDivFail.Visible = false;
                }
                else
                {
                    lblErrorMessage.Text = PType_Resp.response_description;
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
            txt_partner_type.Text = "";
            txt_ret_mob_no.Text = "";
            txt_merchant_name.Text = "";
            ddl_partner_type.SelectedValue = "0";

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