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
    public partial class RechargeCommission : System.Web.UI.Page
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

                ddlVendorList.DataSource = ds.get_rc_VendorList();
                ddlVendorList.DataValueField = "RechargeVendorRefID";
                ddlVendorList.DataTextField = "RechargeVendorName";
                ddlVendorList.DataBind();
                ddlVendorList.Items.Insert(0, new ListItem("Select Vendor", "0"));

                ddlOperatorList.DataSource = ds.get_rc_comm_operatorlist();
                ddlOperatorList.DataValueField = "CommissionRefID";
                ddlOperatorList.DataTextField = "RechargeOperatorName";
                ddlOperatorList.DataBind();
                ddlOperatorList.Items.Insert(0, new ListItem("Select Operator", "0"));

            }

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if(ddlVendorList.SelectedItem.Value=="0")
                {
                    lblErrorMessage.Text = "Please Select Vendor";
                    return;
                }
                if (ddlOperatorList.SelectedItem.Value == "0")
                {
                    lblErrorMessage.Text = "Please Select Operator List";
                    return;
                }
                if (txtNewRC.Text.Trim() == "")
                {
                    lblErrorMessage.Text = "Please Enter Retailer Commission";
                    return;
                }
                if (txtNewDC.Text.Trim() == "")
                {
                    lblErrorMessage.Text = "Please Enter Dist Commission";
                    return;
                }
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("CommissionRefID", Convert.ToInt32(ddlOperatorList.SelectedItem.Value)));
                Cmd.Parameters.Add(new SqlParameter("RetailerComm", txtNewRC.Text));
                Cmd.Parameters.Add(new SqlParameter("DistComm", txtNewDC.Text));
                Cmd.Parameters.Add(new SqlParameter("UserRefID", Convert.ToInt32(Session["user_ref_id"].ToString())));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_UpdateRechargeCommission");

                if (dst.Tables[0].Rows[0][0].ToString() == "100")
                {
                    lblSuccessMessage.Text = "Successfully Updated";
                    return;
                }

                else
                {
                    lblErrorMessage.Text = dst.Tables[0].Rows[0][1].ToString();
                    return;
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Unable to Procss, Please Try Later";
                return;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("../home/RechargeCommission.aspx");
        }

        protected void ddlOperatorList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataSet dst = new DataSet();
                dst = ds.get_rc_comm_operatorlist();
                if (dst != null)
                {
                    if (dst.Tables.Count > 0)
                    {
                        if (dst.Tables[0].Rows.Count > 0)
                        {
                           for(int i = 0; i < dst.Tables[0].Rows.Count; i++)
                            {
                                if (ddlOperatorList.SelectedItem.Value == dst.Tables[0].Rows[i]["CommissionRefID"].ToString())
                                {
                                    lblOldDC.Text = dst.Tables[0].Rows[i]["DistComm"].ToString();
                                    lblOldRC.Text= dst.Tables[0].Rows[i]["RetailerComm"].ToString();
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}