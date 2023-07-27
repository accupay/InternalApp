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
    public partial class AxisBankCDM : System.Web.UI.Page
    {
        datasource ds = new datasource();
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
        VDALSQL MasterDAL = new VDALSQL(ConfigurationSettings.AppSettings["MasterDAL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Header1.ValidateSession();
            if (!IsPostBack)
            {
                rbtnMapping.Checked = true;
                btn_search.Text = "Mapping";
                hdnValue.Value = "1";
            }
        }

        protected void rbtnChooseType_CheckedChanged(object sender, EventArgs e)
        {
            btn_search.Text = "Mapping";
            hdnValue.Value = "1";
            ddlAccountType.SelectedItem.Value = "0";
            txtCardNo.Text = "";
            txtMobileNumber.Text = "";
            ddlAccountType.Enabled = true;
            txtMobileNumber.Enabled = true;
        }

        protected void rbtnChooseType1_CheckedChanged(object sender, EventArgs e)
        {
            btn_search.Text = "Unmapping";
            hdnValue.Value = "2";
            ddlAccountType.SelectedItem.Value = "0";
            txtCardNo.Text = "";
            txtMobileNumber.Text = "";
            ddlAccountType.Enabled = true;
            txtMobileNumber.Enabled = true;
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (hdnValue.Value == "1")
            {
                if (txtCardNo.Text.Trim() == "")
                {
                    lblErrorMessage.Text = "Please Enter Your Card Number";
                    return;
                }
                if (txtMobileNumber.Text.Trim() == "")
                {
                    lblErrorMessage.Text = "Please Enter Your Mobile Number";
                    return;
                }
                if (txtMobileNumber.Text.Length != 10)
                {
                    lblErrorMessage.Text = "Please Enter Valid Mobile Number";
                    return;
                }
                try
                {
                    SqlCommand Cmd = new SqlCommand();
                    Cmd.Parameters.Add(new SqlParameter("AccountTypeRefID", Convert.ToInt32(ddlAccountType.SelectedItem.Value)));
                    Cmd.Parameters.Add(new SqlParameter("AccountMobileNo", txtMobileNumber.Text));
                    Cmd.Parameters.Add(new SqlParameter("CDMCardNumber", txtCardNo.Text));
                    Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));
                    DataSet dst = TransDAL.GetDataSet(Cmd, "APT_InsertAxisBankCDM");
                    if (dst.Tables[0].Rows[0][0].ToString() == "100")
                    {
                        lblSuccessMessage.Text = "Successfully Inserted";
                        ddlAccountType.SelectedItem.Value = "0";
                        txtCardNo.Text = "";
                        txtMobileNumber.Text = "";
                        return;
                    }
                    else
                    {
                        lblErrorMessage.Text = dst.Tables[0].Rows[0][1].ToString();
                        return;
                    }
                }
                catch
                {

                }
            }
            else if (hdnValue.Value == "2")
            {
                if (txtCardNo.Text.Trim() == "")
                {
                    lblErrorMessage.Text = "Please Enter Your Card Number";
                    return;
                }
                if (txtMobileNumber.Text.Trim() == "")
                {
                    lblErrorMessage.Text = "Invalid Mobile Number";
                    return;
                }
                if (txtMobileNumber.Text.Length != 10)
                {
                    lblErrorMessage.Text = "Invalid Mobile Number";
                    return;
                }
                try
                {
                    SqlCommand Cmd = new SqlCommand();                   
                    Cmd.Parameters.Add(new SqlParameter("CDMCardNumber", txtCardNo.Text));
                    Cmd.Parameters.Add(new SqlParameter("ActiveStatusRefID", 3));
                    Cmd.Parameters.Add(new SqlParameter("UserRefID", Session["user_ref_id"].ToString()));
                    DataSet dst = TransDAL.GetDataSet(Cmd, "APT_UpdateAxisBankCDM");
                    if (dst.Tables[0].Rows[0][0].ToString() == "100")
                    {
                        lblSuccessMessage.Text = "Successfully Updated";
                        ddlAccountType.SelectedItem.Value = "0";
                        txtCardNo.Text = "";
                        txtMobileNumber.Text = "";
                        return;
                    }
                    else
                    {
                        lblErrorMessage.Text = dst.Tables[0].Rows[0][1].ToString();
                        return;
                    }
                }
                catch
                {
                    lblSuccessMessage.Text = "Updation Failed";
                    return;
                }
            }
        }

        protected void txtCardNo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (hdnValue.Value == "2")
                {
                    try
                    {
                        SqlCommand Cmd = new SqlCommand();
                        Cmd.Parameters.Add(new SqlParameter("CDMCardNumber", txtCardNo.Text));
                        DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetAxisBankCDM");
                        if (dst != null)
                        {
                            if (dst.Tables.Count > 0)
                            {
                                if (dst.Tables[0].Rows.Count > 0)
                                {
                                    ddlAccountType.SelectedValue = dst.Tables[0].Rows[0]["AccountTypeRefID"].ToString();
                                    txtMobileNumber.Text = dst.Tables[0].Rows[0]["AccountMobileNo"].ToString();
                                    ddlAccountType.Enabled = false;
                                    txtMobileNumber.Enabled = false;
                                    txtMobileNumber.CssClass = "form-control";
                                }
                                else
                                {
                                    lblSuccessMessage.Text = "No redor found";
                                    ddlAccountType.Enabled = false;
                                    txtMobileNumber.Enabled = false;
                                    return;
                                }
                            }
                            else
                            {
                                lblSuccessMessage.Text = "No redor found";
                                ddlAccountType.Enabled = false;
                                txtMobileNumber.Enabled = false;
                                return;
                            }
                        }
                        else
                        {
                            lblSuccessMessage.Text = "No redor found";
                            ddlAccountType.Enabled = false;
                            txtMobileNumber.Enabled = false;
                            return;
                        }
                    }
                    catch
                    {
                        lblSuccessMessage.Text = "No redor found";
                        ddlAccountType.Enabled = false;
                        txtMobileNumber.Enabled = false;
                        return;
                    }
                }
                else
                {
                    ddlAccountType.Enabled = true;
                    txtMobileNumber.Enabled = true;
                    return;
                }
            }
            catch
            {                
                return;
            }
        }
    }
}