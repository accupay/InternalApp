using InternalApp.admin.home;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using static InternalApp.BeneValidation;
using System.Data;

namespace InternalApp.admin.reports
{
    public partial class PayeeApproval : System.Web.UI.Page
    {
        rptdatasource ds = new rptdatasource();
        BeneValidation_Response BV = new BeneValidation_Response();
        protected void Page_Load(object sender, EventArgs e)
        {
            // FDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            //ToDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
           Header1.ValidateSession();
            if(!IsPostBack)
            {
                hdnStatusValue.Value = "1";
                hdnAgentID.Value = "0";
                hdnBtnValue.Value = "0";
            }
        }

        protected void btnSubmitPasswordChange_Click(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        private void BindGrid()
        {
            try
            {
                grd_AgentApproval_report.Visible = true;
                grd_AgentApproval_report.DataSource = ds.AgentApproval_rpt(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text), txtAgentMobileNo.Text);
                grd_AgentApproval_report.DataBind();
                lblMblNo.Visible = true;
                lblMblNo1.Visible = true;
                lblAccNo.Visible = true;
                lblAccNo1.Visible = true;
                lblMessage.Visible = true;
                btnOk.Visible = true;
                btnCancel.Visible = true;
                for (int i = 0; i < grd_AgentApproval_report.Rows.Count; i++)
                {
                    Label AppStatus = grd_AgentApproval_report.Rows[i].Cells[13].FindControl("GvLblApproveStatus") as Label;
                    Label beneApproveStatus = grd_AgentApproval_report.Rows[i].Cells[10].FindControl("GvLblAccountValidationStatus") as Label;
                    Button BtnBeneCheck = grd_AgentApproval_report.Rows[i].Cells[0].FindControl("GvBtnCheck") as Button;
                    Button BtnApprove = grd_AgentApproval_report.Rows[i].Cells[1].FindControl("GvBtnApprove") as Button;
                    Button BtnReject = grd_AgentApproval_report.Rows[i].Cells[1].FindControl("GvBtnReject") as Button;
                    if (beneApproveStatus.Text.Trim() == "Success" || beneApproveStatus.Text.Trim() == "Rejected")
                    {
                        BtnBeneCheck.Visible = false;
                    }
                    else
                    {
                        BtnBeneCheck.Visible = true;
                    }
                    if (AppStatus.Text.Trim() == "Success" || AppStatus.Text.Trim() == "Approved" || AppStatus.Text.Trim() == "Failed" || AppStatus.Text.Trim() == "Rejected")
                    {
                        BtnApprove.Visible = false;
                        BtnReject.Visible = false;
                    }
                    else
                    {
                        BtnApprove.Visible = true;
                        BtnReject.Visible = true;
                    }
                }
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
            grd_AgentApproval_report.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GvBtnCheck_Click(object sender, EventArgs e)
        {
            try
            {
                hdnBtnValue.Value = "1";
                Button btnEdit = (Button)sender;
                GridViewRow Grow = (GridViewRow)btnEdit.NamingContainer;
                Label txtledName = (Label)Grow.FindControl("GvLblAgentPayeeRefID");
                Label mblno = (Label)Grow.FindControl("GvLblAgentMobileNo");
                Label accno = (Label)Grow.FindControl("GvLblBankAccountNumber");
                Label bankname = (Label)Grow.FindControl("GvLblBankName");
                Label ifsc_code = (Label)Grow.FindControl("GvLblIFSCCode");
                lblAccNo1.Text = accno.Text;
                lblMblNo1.Text = mblno.Text;
                hdnBankName.Value = bankname.Text;
                hdnIfscCode.Value = ifsc_code.Text;
                lblMessage.Text = "Kindly confirm for the Bene Validation";
                btnCancel.Visible = true;
                btnOk.Visible = true;
                lblMblNo.Visible = true;
                lblMblNo1.Visible = true;
                lblAccNo.Visible = true;
                lblAccNo1.Visible = true;
                lblMessage.Visible = true;
                MdlEx.Show();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GvBtnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                hdnBtnValue.Value = "2";
                Button Approve = (Button)sender;
                GridViewRow Grow = (GridViewRow)Approve.NamingContainer;
                Label GvLblAgentPayeeRefID = (Label)Grow.FindControl("GvLblAgentPayeeRefID");
                Label mblno = (Label)Grow.FindControl("GvLblAgentMobileNo");
                Label accno = (Label)Grow.FindControl("GvLblBankAccountNumber");
                hdnAgentID.Value = GvLblAgentPayeeRefID.Text;
                hdnStatusValue.Value = "2";
                lblMessage.Text = "Kindly confirm for the Approval";
                lblMblNo.Visible = true;
                lblMblNo1.Visible = true;
                lblAccNo.Visible = true;
                lblAccNo1.Visible = true;
                lblMessage.Visible = true;
                btnOk.Visible = true;
                btnCancel.Visible = true;
                lblAccNo1.Text = accno.Text;
                lblMblNo1.Text = mblno.Text;
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
                hdnBtnValue.Value = "2";
                Button Approve = (Button)sender;
                GridViewRow Grow = (GridViewRow)Approve.NamingContainer;
                Label GvLblAgentPayeeRefID = (Label)Grow.FindControl("GvLblAgentPayeeRefID");
                Label mblno = (Label)Grow.FindControl("GvLblAgentMobileNo");
                Label accno = (Label)Grow.FindControl("GvLblBankAccountNumber");
                hdnAgentID.Value = GvLblAgentPayeeRefID.Text;
                lblMessage.Text = "Kindly confirm for the Rejection";
                hdnStatusValue.Value = "3";
                lblMblNo.Visible = true;
                lblMblNo1.Visible = true;
                lblAccNo.Visible = true;
                lblAccNo1.Visible = true;
                lblMessage.Visible = true;
                btnOk.Visible = true;
                btnCancel.Visible = true;
                lblAccNo1.Text = accno.Text;
                lblMblNo1.Text = mblno.Text;
                MdlEx.Show();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            if (hdnBtnValue.Value == "2")
            {
                try
                {
                    DataSet dss = ds.AgentStatusApproval(Convert.ToInt32(hdnAgentID.Value), Convert.ToInt32(hdnStatusValue.Value), "", Convert.ToInt32(Session["user_ref_id"]));
                    this.BindGrid();
                    if (dss != null)
                    {
                        if (dss.Tables[0].Rows.Count > 0)
                        {
                            if (hdnStatusValue.Value == "2")
                            {
                                lblMessage.Text = "Approved Successfully";
                            }
                            else
                            {
                                lblMessage.Text = "Rejected Successfully";
                            }                            
                            lblAccNo.Visible = false;
                            lblAccNo1.Visible = false;
                            lblMblNo.Visible = false;
                            lblMblNo1.Visible = false;
                            btnOk.Visible = false;
                            MdlEx.Show();
                        }
                    }
                }
                catch
                {

                }    
            }
            else
            {
                try
                {
                    string BeneValidation = ConfigurationManager.AppSettings["BeneValidation"];
                    ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                    var httpWebRequest = (HttpWebRequest)WebRequest.Create(BeneValidation);
                    httpWebRequest.ContentType = "application/json; charset=utf-8";
                    httpWebRequest.Method = "POST";
                    using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                    {
                        string auth_Reg = new JavaScriptSerializer().Serialize(new
                        {
                            sender_mobile_number = lblMblNo1.Text,
                            payee_ref_id = "2",
                            amount = "1",
                            payment_transaction_type_refid = "5",
                            pay_mode_ref_id = "1",
                            agent_mobile = lblMblNo1.Text,
                            account_number_in = lblAccNo1.Text,
                            agent_ref_id = Session["user_ref_id"].ToString(),
                            bank_name = hdnBankName.Value,
                            ifsc_code = hdnIfscCode.Value

                            //sender_mobile_number = "9884149798",
                            //payee_ref_id = "2",
                            //amount = "1",
                            //payment_transaction_type_refid = "5",
                            //pay_mode_ref_id = "1",
                            //agent_mobile = "1234567890",
                            //account_number_in = "064999500000600",
                            //agent_ref_id = "1",
                            //bank_name = "Yes Bank",
                            //ifsc_code = "YESB0000699"
                        }) ;
                        streamWriter.Write(auth_Reg);
                        streamWriter.Flush();
                        streamWriter.Close();

                        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                        {
                            var jsonRes = streamReader.ReadToEnd();
                            dynamic jsonsplit = JObject.Parse(jsonRes);

                            BV.response_code = jsonsplit.response_code;
                            BV.response_message = jsonsplit.response_message;
                            if (BV.response_code == "200")  //Success
                            {
                                lblMessage.Text = jsonsplit.data.beneficiaryName;
                                lblAccNo.Visible = false;
                                lblAccNo1.Visible = false;
                                lblMblNo.Visible = false;
                                lblMblNo1.Visible = false;
                                btnOk.Visible = false;
                                MdlEx.Show();
                                return;
                            }
                        }
                    }
                }
                catch (WebException wex)
                {
                    if (wex.Response != null)
                    {
                        using (var errorResponse = (HttpWebResponse)wex.Response)
                        {
                            using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                            {
                                string error = reader.ReadToEnd();

                                try
                                {
                                    dynamic jsonsplit = JObject.Parse(error);
                                    BV.response_code = jsonsplit.response_code;
                                    BV.response_message = jsonsplit.response_message;
                                    //lblErrorMessage.Text = BV.response_message;

                                    lblMessage.Text = jsonsplit.response_message;
                                    lblAccNo.Visible = false;
                                    lblAccNo1.Visible = false;
                                    lblMblNo.Visible = false;
                                    lblMblNo1.Visible = false;
                                    btnOk.Visible = false;
                                    MdlEx.Show();
                                    return;
                                }
                                catch (Exception ex)
                                {
                                    BV.response_code = "151";
                                    BV.response_message = wex.Message;
                                    lblMessage.Text = wex.Message;
                                    btnOk.Visible = false;
                                    lblAccNo.Visible = false;
                                    lblAccNo1.Visible = false;
                                    lblMblNo.Visible = false;
                                    lblMblNo1.Visible = false;
                                    MdlEx.Show();
                                    return;
                                    // lblErrorMessage.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        protected void grd_AgentApproval_report_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grd_AgentApproval_report.PageIndex = e.NewPageIndex;
                this.BindGrid();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
