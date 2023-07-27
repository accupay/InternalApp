using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using VDAL;
using System.Security.Cryptography;

namespace InternalApp.admin.home
{
    public partial class Deposit_Slip_Approval : System.Web.UI.Page
    {
        datasource ds = new datasource();
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            // FDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            //ToDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            Header1.ValidateSession();
            if (!IsPostBack)
            {
                hdnStatusValue.Value = "1";
                hdndep_slip.Value = "";
                hdnAmt.Value = "";
                hdnmobileno.Value = "";
                txt_Amount.Text = "";
                // hdnAgentID.Value = GvLblAgentPayeeRefID.Text;
                //  hdnStatusValue.Value = "2";
                //  hdnAgentID.Value = "0";

                ddl_topup_type.DataSource = ds.Depositslip_type();
                ddl_topup_type.DataValueField = "TopUpTypeRefID";
                ddl_topup_type.DataTextField = "TopUpType";
                ddl_topup_type.DataBind();
                ddl_topup_type.Items.Insert(0, new ListItem("-- Select Type --", "0"));


                //Load Deposited Bank

                ddl_dep_bank_name.DataSource = ds.Depositslip_bank_list();
                ddl_dep_bank_name.DataValueField = "BankRefID";
                ddl_dep_bank_name.DataTextField = "Name";
                ddl_dep_bank_name.DataBind();
                ddl_dep_bank_name.Items.Insert(0, new ListItem("-- Select Bank Name --", "0"));

                this.BindGrid();
            }
        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            //if (ddl_dep_bank_name.SelectedValue.ToString() == "0")

            //{
            //    lblErrorMessage.Text = "Please Select Deposited Bank Name";
            //    return;
            //}
            //if (ddl_topup_type.SelectedValue.ToString() == "0")

            //{
            //    lblErrorMessage.Text = "Please Select TopUp Type";
            //    return;
            //}
            // if (string.IsNullOrEmpty(txt_Amount.Text))
            //{
            //txt_Amount.Text = "0";
            // }

            this.BindGrid();


        }
        protected void btnSubmitPasswordChange_Click(object sender, EventArgs e)
        {

        }

        //protected void btn_submit_Click(object sender, EventArgs e)
        //{



        //    this.BindGrid();
        //}
        private void BindGrid()
        {
            try
            {
                grd_dep_slip.Visible = true;
                grd_dep_slip.DataSource = ds.get_Depositslip_upload_dtls(Convert.ToInt32(ddl_topup_type.SelectedValue), Convert.ToInt32(ddl_dep_bank_name.SelectedValue), txt_Amount.Text);
                grd_dep_slip.DataBind();
            }
            catch (Exception ex)
            {
            }

        }
        protected void btn_excel_Click(object sender, EventArgs e)
        {

        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_dep_slip.PageIndex = e.NewPageIndex;

            this.BindGrid();
        }


        protected void GvBtnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                Button Approve = (Button)sender;
                GridViewRow Grow = (GridViewRow)Approve.NamingContainer;
                Label lbldep_slip_refid = (Label)Grow.FindControl("lblDepositSlipRefID");
                Label lbl_Amount = (Label)Grow.FindControl("lblAmount");
                Label lblmobile_no = (Label)Grow.FindControl("lblMobileNumber");
                hdndep_slip.Value = lbldep_slip_refid.Text;
                hdnAmt.Value = lbl_Amount.Text;
                hdnmobileno.Value = lblmobile_no.Text;
                lblRemarks.Visible = false;
                txtremarks.Visible = false;
                // hdnAgentID.Value = GvLblAgentPayeeRefID.Text;
                hdnStatusValue.Value = "2";
                lbl_App_Mobile_no.Text = lblmobile_no.Text;
                lbl_App_Amount.Text = lbl_Amount.Text;
                lblMessage.Text = "Kindly confirm for the Approval";
                lblMessage.ForeColor = System.Drawing.Color.Black;
                txtremarks.Text = "";
                btnOk.Visible = true;
                btnCancel.Text = "Cancel";
                MdlEx.Show();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GvBtnReject_Click(object sender, EventArgs e)
        {
            try
            {
                Button Approve = (Button)sender;
                GridViewRow Grow = (GridViewRow)Approve.NamingContainer;
                Label lbldep_slip_refid = (Label)Grow.FindControl("lblDepositSlipRefID");
                Label lbl_Amount = (Label)Grow.FindControl("lblAmount");
                Label lblmobile_no = (Label)Grow.FindControl("lblMobileNumber");
                hdndep_slip.Value = lbldep_slip_refid.Text;
                hdnAmt.Value = lbl_Amount.Text;
                hdnmobileno.Value = lblmobile_no.Text;
                lbl_App_Mobile_no.Text = lblmobile_no.Text;
                lbl_App_Amount.Text = lbl_Amount.Text;
                // hdnAgentID.Value = GvLblAgentPayeeRefID.Text;
                lblMessage.Text = "Kindly confirm for the Rejection";
                hdnStatusValue.Value = "3";
                lblRemarks.Visible = true;
                txtremarks.Visible = true;
                txtremarks.Focus();
                btnOk.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Black;
                btnCancel.Text = "Cancel";
                MdlEx.Show();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dss = ds.Depositslip_Status_Update(Convert.ToInt32(hdndep_slip.Value), Convert.ToInt32(hdnStatusValue.Value), Convert.ToInt32(Session["user_ref_id"]), txtremarks.Text);
                if (dss != null)
                {
                    if (dss.Tables[0].Rows[0][0].ToString() == "100")
                    {
                        // lblSuccessMessage.Text = "Successfully Updated";

                        if (string.IsNullOrEmpty(txt_Amount.Text))
                        {
                            txt_Amount.Text = "";
                        }
                        this.BindGrid();

                        if (hdnStatusValue.Value == "2")
                        {
                            txt_Amount.Text = "";
                            lblMessage.Text = "Approved Successfully";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            txt_Amount.Text = "";
                            lblMessage.Text = "Rejected Successfully";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        btnOk.Visible = false;
                        btnCancel.Text = "Close";
                        MdlEx.Show();

                    }

                    else
                    {
                        lblErrorMessage.Text = dss.Tables[0].Rows[0]["ResponseDescription"].ToString();
                        return;
                    }
                    //  lblSuccessMessage.Text = "Successfully Updated";
                    // return;               
                }

                else
                {
                    lblErrorMessage.Text = "Updation Failed";
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }




        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        protected void grd_dep_slip_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grd_dep_slip.PageIndex = e.NewPageIndex;

                this.BindGrid();
            }
            catch (Exception ex)
            {
            }
        }
    }

}
    
