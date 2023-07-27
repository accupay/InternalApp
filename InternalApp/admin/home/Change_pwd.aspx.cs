
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
using static InternalApp.Model;

namespace InternalApp.admin.home
{
    public partial class change_pwd : System.Web.UI.Page
    {
        private static string changePwd = ConfigurationManager.AppSettings["ChangePwd"];
        AuthLogin_Response change_pwd_resp = new AuthLogin_Response();
        protected void Page_Load(object sender, EventArgs e)
        {
           Header1.ValidateSession();
            if (!IsPostBack)
            {
                txt_old_pwd.Focus();
            }
        }

        

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_old_pwd.Text == "")
                {
                    lblErrorMessage.Text ="Please Enter Old Password";
                    return;
                }
                
                   else if (txt_new_pwd.Text == "")
                    {
                        lblErrorMessage.Text ="Please Enter New Password";
                        return;
                    }
                    else if (txt_confirm_pwd.Text == "")
                    {
                        lblErrorMessage.Text ="Please Re Enter New Password";
                        return;
                    }
                
                
                    else if (txt_new_pwd.Text != txt_confirm_pwd.Text)
                    {
                        lblErrorMessage.Text ="Password Mismatch. New Password and Confirm Password does not match.";
                        return;
                    }
                int retstatus = Utilities.ValidatePassword(txt_new_pwd.Text);
                if (retstatus == 0)
                {
                    lblErrorMessage.Text ="Password Should Be at Least 8 Characters long with at least 1 lower case, 1 upper case, 1 Number, 1 Special Character";
                    return;
                }

                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                var httpWebRequest = (HttpWebRequest)WebRequest.Create(changePwd);
                httpWebRequest.ContentType = "application/json; charset=utf-8";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string auth_Reg = new JavaScriptSerializer().Serialize(new
                    {
                        ref_id = Session["user_ref_id"].ToString(),
                        old_password= txt_old_pwd.Text,
                        account_type = "1",
                        new_password = txt_new_pwd.Text
                    });
                    streamWriter.Write(auth_Reg);
                    streamWriter.Flush();
                    streamWriter.Close();

                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        var jsonRes = streamReader.ReadToEnd();
                        dynamic jsonsplit = JObject.Parse(jsonRes);
                        
                        change_pwd_resp.response_code = jsonsplit.response_code;
                        change_pwd_resp.response_message = jsonsplit.response_message;
                        if (change_pwd_resp.response_code == "200")  //Success
                        {
                            lblSuccessMessage.Text ="Password Changed Successfully. Please login now.";
                            txt_old_pwd.Text = "";
                            txt_new_pwd.Text = "";
                            txt_confirm_pwd.Text = "";
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
                                change_pwd_resp.response_code = jsonsplit.response_code;
                                change_pwd_resp.response_message = jsonsplit.response_message;
                                lblErrorMessage.Text =change_pwd_resp.response_message;
                                return;
                            }
                            catch (Exception ex)
                            {
                                change_pwd_resp.response_code = "151";
                                change_pwd_resp.response_message = wex.Message;
                                lblErrorMessage.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
                            }
                        }

                    }
                }

            }
            catch (Exception ex)
            {
            }



        }

        //void lblSuccessMessage.Text =string MSG)
        //{
        //    LblSuccessStatus.Text = MSG;
        //    StatusDivFail.Visible = false;
        //    StatusDivSuccess.Visible = true;
        //}
        //void ShowFailStatus(string MSG)
        //{
        //    LblFailStatus.Text = MSG;
        //    StatusDivFail.Visible = true;
        //    StatusDivSuccess.Visible = false;
        //}

    }
}