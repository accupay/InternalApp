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
    public partial class PGTopupCredit : System.Web.UI.Page
    {
        datasource ds = new datasource();
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
        VDALSQL MasterDAL = new VDALSQL(ConfigurationSettings.AppSettings["MasterDAL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

          Header1.ValidateSession();
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";
            if (!IsPostBack)
            {
                rbtnChooseType.Checked = true;
                divrbtn2.Visible = true;
                divrbtn3.Visible = false;
                divrbtn4.Visible = false;
                hdnrbtnvalue.Value = "7";
                topuptype();
                cardtypetype();
                cardsubtypetype();
            }

        }
        public void topuptype()
        {
            ddlTopupType.DataSource = ds.get_topup_type_list();
            ddlTopupType.DataValueField = "TopUpTypeRefID";
            ddlTopupType.DataTextField = "TopupType";
            ddlTopupType.DataBind();
            ddlTopupType.Items.Insert(0, new ListItem("Select Topup Type", "0"));
        }
        public void cardtypetype()
        {
            ddlCardType.DataSource = ds.get_Card_type_list();
            ddlCardType.DataValueField = "CardRefID";
            ddlCardType.DataTextField = "CardName";
            ddlCardType.DataBind();
            ddlCardType.Items.Insert(0, new ListItem("Select Card Type", "0"));
        }
        public void cardsubtypetype()
        {
            ddlCardSubType.DataSource = ds.get_Card_sub_type_list();
            ddlCardSubType.DataValueField = "CardSubTypeRefID";
            ddlCardSubType.DataTextField = "CardSubTypeName";
            ddlCardSubType.DataBind();
            ddlCardSubType.Items.Insert(0, new ListItem("Select Card Sub-Type", "0"));
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                //if (string.IsNullOrEmpty(txt_mobile_no.Text))
                //{
                //    lblErrorMessage.Text ="Enter a Valid Mobile No";
                //    return;
                //}

                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("Bankrefid",Convert.ToInt32(hdnrbtnvalue.Value)));
                Cmd.Parameters.Add(new SqlParameter("Topuptype", Convert.ToInt32(ddlTopupType.SelectedItem.Value)));
                Cmd.Parameters.Add(new SqlParameter("Vendororderid", txtVendorOrderID.Text));
                Cmd.Parameters.Add(new SqlParameter("VenderPaymentid", txtVendorPaymentID.Text));
                Cmd.Parameters.Add(new SqlParameter("VendorRefno", txtVenorReferenceNo.Text));
                Cmd.Parameters.Add(new SqlParameter("CardRefid", Convert.ToInt32(ddlCardType.SelectedItem.Value)));
                Cmd.Parameters.Add(new SqlParameter("Cardsubtyperefid", Convert.ToInt32(ddlCardSubType.SelectedItem.Value)));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_PGTOPUPCREDIT");
                                
                if (dst.Tables[0].Rows[0][0].ToString() == "100")
                {
                    lblSuccessMessage.Text ="Successfully Updated";
                    return;
                }

                else
                {
                    lblErrorMessage.Text =dst.Tables[0].Rows[0][1].ToString();
                    return;
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text ="Unable to Procss, Please Try Later";
                return;
            }
        }
        public void clear()
        {
            txtVendorOrderID.Text = "";
            txtVendorPaymentID.Text = "";
            txtVenorReferenceNo.Text = "";
            topuptype();
            cardtypetype();
            cardsubtypetype();
        }

        protected void rbtnChooseType_CheckedChanged(object sender, EventArgs e)
        {
            clear();
            divrbtn2.Visible = true;
            divrbtn3.Visible = false;
            divrbtn4.Visible = false;
            hdnrbtnvalue.Value = "7";
        }

        protected void rbtnChooseType1_CheckedChanged(object sender, EventArgs e)
        {
            clear();
            divrbtn2.Visible = true;
            divrbtn3.Visible = true;
            divrbtn4.Visible = true;
            hdnrbtnvalue.Value = "2";
        }
    }
}