using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using VDAL;
using System.Configuration;
using System.Text.RegularExpressions;
using static InternalApp.Model;
using Microsoft.Ajax.Utilities;
using System.Security.Cryptography;
using static System.Net.WebRequestMethods;

namespace InternalApp.admin.home
{
    public partial class login : System.Web.UI.Page
    {
        private static string AuthLogin = ConfigurationManager.AppSettings["AuthLogin"];
        private static string AuthOtpcheck = ConfigurationManager.AppSettings["AuthOtpCheck"];
        private static string ForgotPwdOtp = ConfigurationManager.AppSettings["ForgotPwdOtp"];
        private static string ForgotPwd = ConfigurationManager.AppSettings["ForgotPwd"];
        admin_info_resp testing = new admin_info_resp();
        datasource datasource = new datasource();

        AuthLogin_Response auth_login_resp = new AuthLogin_Response();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["LGT"] != null)
                {
                    Session["sid"] = "";
                    Session["token_id"] = "";
                    Session["session_id"] = "";
                    Session["sys_IP"] = "";
                    Session["mac_id"] = "";
                    Session["user_ref_id"] = "";
                    Session["first_name"] = "";

                    Session["last_name"] = "";
                    Session["usergroup_ref_id"] = "";
                    Session["dob"] = "";
                    Session["active_status"] = "";

                }
            }
            catch
            {
            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                txtPasswordChangeUID.Text = "";

                if (!txt_uid.ReadOnly)
                {
                    try
                    {

                        if (txt_uid.Text == "")
                        {
                            lbl_status.Text = "User ID should not be empty";
                            return;
                        }
                        if (txt_pwd.Text == "")
                        {
                            lbl_status.Text = "Password should not be empty";
                            return;
                        }

                        string ip = Utilities.GetMacIP(Request);
                        Session["sys_IP"] = ip;
                        string MacID = Utilities.GetMacDetails(Request, Response);
                        Session["mac_id"] = MacID;

                        ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                        var httpWebRequest = (HttpWebRequest)WebRequest.Create(AuthLogin);
                        httpWebRequest.ContentType = "application/json; charset=utf-8";
                        httpWebRequest.Method = "POST";
                        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                        {
                            string auth_Reg = new JavaScriptSerializer().Serialize(new
                            {
                                user_id = txt_uid.Text,
                                password = txt_pwd.Text,
                                account_type_ref_id = "1",
                                mac_id = MacID,
                                ip = ip

                            });
                            streamWriter.Write(auth_Reg);
                            streamWriter.Flush();
                            streamWriter.Close();

                            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                            {
                                var jsonRes = streamReader.ReadToEnd();
                                dynamic jsonsplit = JObject.Parse(jsonRes);

                                auth_login_resp.response_code = jsonsplit.response_code;
                                auth_login_resp.response_message = jsonsplit.response_message;
                                auth_login_resp.data.sid = jsonsplit.data.sid;
                                auth_login_resp.data.token_id = jsonsplit.data.token_id;
                                auth_login_resp.data.session_id = jsonsplit.data.session_id;
                                txtPasswordChangeUID.Text = txt_uid.Text;
                                Session["sid"] = auth_login_resp.data.sid;
                                Session["token_id"] = auth_login_resp.data.token_id;
                                Session["session_id"] = auth_login_resp.data.session_id;
                                if (auth_login_resp.response_code == "200")  //Success
                                {
                                    admin_info_resp admin_resp = new admin_info_resp();

                                    admin_resp = datasource.admin_info(txt_uid.Text);
                                    if (admin_resp.response_code == "0")
                                    {
                                        Session["user_ref_id"] = admin_resp.staff_ref_id;
                                        Session["first_name"] = admin_resp.first_name;

                                        Session["last_name"] = admin_resp.last_name;
                                        Session["usergroup_ref_id"] = admin_resp.usergroup_ref_id;
                                        Session["dob"] = admin_resp.dob;
                                        Session["active_status"] = admin_resp.active_status;
                                        if (admin_resp.active_status == "2")
                                        {
                                            Response.Redirect("home.aspx");
                                        }
                                        else
                                        {
                                            lbl_status.Text = "Your account has been blocked. Please connect with your administrator.";
                                        }
                                    }
                                    else
                                    {
                                        lbl_status.Text = "Invalid Mobile Number.";
                                    }
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
                                        auth_login_resp.response_code = jsonsplit.response_code;
                                        auth_login_resp.response_message = jsonsplit.response_message;

                                        //string error_type = jsonsplit.errors.error_type;

                                        //string error_description = jsonsplit.errors.error_description;

                                        if (auth_login_resp.response_code == "101")  //Machine Changed
                                        {
                                            lbl_status.Text = auth_login_resp.response_message;
                                            auth_login_resp.data.sid = jsonsplit.data.sid;
                                            auth_login_resp.data.token_id = jsonsplit.data.token_id;
                                            auth_login_resp.data.session_id = jsonsplit.data.session_id;
                                            Session["sid"] = auth_login_resp.data.sid;
                                            Session["token_id"] = auth_login_resp.data.token_id;
                                            Session["session_id"] = auth_login_resp.data.session_id;
                                            txtPasswordChangeUID.Text = txt_uid.Text;

                                            txt_uid.ReadOnly = true;
                                            txt_pwd.Visible = true;
                                            txt_pwd.Text = "";
                                            txt_pwd.Attributes["placeholder"] = "Enter the OTP and click Sigin";
                                            //BtnGenerateOTP.Visible = false;
                                            BtnSubmit.Visible = true;
                                            //  DivTerms.Visible = false;
                                            return;
                                        }
                                        else
                                        {
                                            lbl_status.Text = auth_login_resp.response_message;
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        auth_login_resp.response_code = "151";
                                        auth_login_resp.response_message = wex.Message;
                                        lbl_status.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
                                    }
                                }

                            }
                        }




                    }
                }

                else      //Machnie changed. OTP Validate
                {


                    ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                    var httpWebRequest = (HttpWebRequest)WebRequest.Create(AuthOtpcheck);
                    httpWebRequest.ContentType = "application/json; charset=utf-8";
                    httpWebRequest.Method = "POST";
                    using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                    {
                        string auth_Reg = new JavaScriptSerializer().Serialize(new
                        {
                            account_type = "1",
                            token_id = Session["token_id"].ToString(),
                            otp = txt_pwd.Text,
                            session_id = Session["session_id"].ToString(),
                            mobile_no = txt_uid.Text
                        });
                        streamWriter.Write(auth_Reg);
                        streamWriter.Flush();
                        streamWriter.Close();

                        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                        {
                            var jsonRes = streamReader.ReadToEnd();
                            dynamic jsonsplit = JObject.Parse(jsonRes);

                            auth_login_resp.response_code = jsonsplit.response_code;
                            auth_login_resp.response_message = jsonsplit.response_message;
                            auth_login_resp.data.sid = jsonsplit.data.sid;
                            auth_login_resp.data.token_id = jsonsplit.data.token_id;
                            auth_login_resp.data.session_id = jsonsplit.data.session_id;
                            Session["sid"] = auth_login_resp.data.sid;
                            Session["token_id"] = auth_login_resp.data.token_id;
                            Session["session_id"] = auth_login_resp.data.session_id;

                            if (auth_login_resp.response_code == "200")  //Success
                            {
                                admin_info_resp admin_resp = new admin_info_resp();

                                admin_resp = datasource.admin_info(txt_uid.Text);
                                if (admin_resp.response_code == "0")
                                {
                                    Session["user_ref_id"] = admin_resp.staff_ref_id;
                                    Session["first_name"] = admin_resp.first_name;

                                    Session["last_name"] = admin_resp.last_name;
                                    Session["usergroup_ref_id"] = admin_resp.usergroup_ref_id;
                                    Session["dob"] = admin_resp.dob;
                                    Session["active_status"] = admin_resp.active_status;
                                    if (admin_resp.active_status == "2")
                                    {
                                        Response.Redirect("home.aspx");
                                    }
                                    else
                                    {
                                        lbl_status.Text = "Your account has been blocked. Please connect with your administrator.";
                                    }
                                }
                                else
                                {
                                    lbl_status.Text = "Invalid Mobile Number.";
                                }



                            }
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
                                auth_login_resp.response_code = jsonsplit.response_code;
                                auth_login_resp.response_message = jsonsplit.response_message;
                                auth_login_resp.data.sid = jsonsplit.data.sid;
                                auth_login_resp.data.token_id = jsonsplit.data.token_id;
                                auth_login_resp.data.session_id = jsonsplit.data.session_id;
                                Session["sid"] = auth_login_resp.data.sid;
                                Session["token_id"] = auth_login_resp.data.token_id;
                                Session["session_id"] = auth_login_resp.data.session_id;
                                //string error_type = jsonsplit.errors.error_type;

                                //string error_description = jsonsplit.errors.error_description;
                                lbl_status.Text = auth_login_resp.response_message;
                                return;

                            }
                            catch (Exception ex)
                            {
                                auth_login_resp.response_code = "151";
                                auth_login_resp.response_message = wex.Message;
                                lbl_status.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
                            }
                        }

                    }
                }
                //if (CurrentSession.ResponseCode == 101)
                //{
                //  //Response.Redirect("../../AdminHome.aspx?VSID=" + Server.UrlEncode(CurrentSession.VSID));
                //  Response.Redirect("./home.aspx");
                //}
                //else
                //{
                //  lbl_status.Text = "Invalid OTP";
                //}
            }


            catch (Exception ex)
            {
            }
        }


        protected void btnSubmitPasswordChange_Click(object sender, EventArgs e)
        {

            try
            {

                if (txtPasswordChangeUID.Text == "")
                {
                    lblChangePasswordStatus.Text = "Invalid UID";
                    return;
                }
                else if (txtPasswordChangeOTP.Text == "" || !Utilities.FieldValidation(true, 6, txtPasswordChangeOTP.Text.ToCharArray(), "n", ""))

                {
                    lblChangePasswordStatus.Text = "Enter Valid OTP";
                    return;
                }
                else if (txtNewPassword.Text == "")
                {
                    lblChangePasswordStatus.Text = "Invalid New Password";
                    return;
                }
                else if (txtConfirmNewPassword.Text == "")
                {
                    lblChangePasswordStatus.Text = "Invalid Confirm New Password";
                    return;
                }
                else if (txtNewPassword.Text != txtConfirmNewPassword.Text)
                {
                    lblChangePasswordStatus.Text = "New Password and Confirm New Password Does Not Match";
                    return;
                }
                else if (txtNewPassword.Text == txtOldPassword.Text)
                {
                    lblChangePasswordStatus.Text = "Old Password and New Password Cannot be Same";
                    return;
                }
                int retstatus = Utilities.ValidatePassword(txtNewPassword.Text);
                if (retstatus == 0)
                {
                    lblChangePasswordStatus.Text = "Password Should Be at Least 8 Characters long with at least 1 lower case, 1 upper case, 1 Number, 1 Special Character";
                    return;
                }

                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                var httpWebRequest = (HttpWebRequest)WebRequest.Create(ForgotPwd);
                httpWebRequest.ContentType = "application/json; charset=utf-8";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string auth_Reg = new JavaScriptSerializer().Serialize(new
                    {
                        mobile_no = txtPasswordChangeUID.Text,
                        account_type = "1",
                        otp = txtPasswordChangeOTP.Text,
                        password = txtNewPassword.Text
                    });
                    streamWriter.Write(auth_Reg);
                    streamWriter.Flush();
                    streamWriter.Close();

                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        var jsonRes = streamReader.ReadToEnd();
                        dynamic jsonsplit = JObject.Parse(jsonRes);
                        auth_login_resp.response_code = jsonsplit.response_code;
                        auth_login_resp.response_message = jsonsplit.response_message;
                        if (auth_login_resp.response_code == "200")  //Success
                        {
                            lbl_status.Text = "Password Changed. Please login now.";
                            txt_pwd.Text = "";
                            div_login.Visible = true;
                            divAdminChangePassword.Visible = false;
                            btnSubmitResetPasswordChange.Visible = false;
                            txt_uid.ReadOnly = false;
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
                                auth_login_resp.response_code = jsonsplit.response_code;
                                auth_login_resp.response_message = jsonsplit.response_message;
                                lbl_status.Text = auth_login_resp.response_message;
                                return;
                            }
                            catch (Exception ex)
                            {
                                auth_login_resp.response_code = "151";
                                auth_login_resp.response_message = wex.Message;
                                lbl_status.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
                            }
                        }

                    }
                }
            }

            catch (Exception ex)
            {

            }

        }

        protected void btnSubmitResetPasswordChange_Click(object sender, EventArgs e)
        {

        }


        protected void btnSubmitPasswordBack_Click(object sender, EventArgs e)
        {
            lbl_status.Text = "";
            lblChangePasswordStatus.Text = "";
            txt_pwd.Text = "";
            div_login.Visible = true;
            divAdminChangePassword.Visible = false;
            btnSubmitResetPasswordChange.Visible = false;

        }

        protected void lnk_btn_FgtPwd_Click(object sender, EventArgs e)
        {

            try
            {

                if (txt_uid.Text == "")
                {
                    lbl_status.Text = "User ID should not be empty";
                    return;
                }

                //ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                //ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                var httpWebRequest = (HttpWebRequest)WebRequest.Create(ForgotPwdOtp);
                httpWebRequest.ContentType = "application/json; charset=utf-8";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string auth_Reg = new JavaScriptSerializer().Serialize(new
                    {
                        mobile_no = txt_uid.Text,
                        account_type = "1"
                    });
                    streamWriter.Write(auth_Reg);
                    streamWriter.Flush();
                    streamWriter.Close();

                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        var jsonRes = streamReader.ReadToEnd();
                        dynamic jsonsplit = JObject.Parse(jsonRes);
                        auth_login_resp.response_code = jsonsplit.response_code;
                        auth_login_resp.response_message = jsonsplit.response_message;
                        if (auth_login_resp.response_code == "200")  //Success
                        {
                            //lbl_status.Text = " OTP has been sent to your mobile number.";

                            lblChangePasswordStatus.Text = "OTP has been sent to your registered Mobile No.";
                            txtPasswordChangeUID.Text = txt_uid.Text;
                            div_login.Visible = false;
                            divAdminChangePassword.Visible = true;
                            btnSubmitResetPasswordChange.Visible = false;
                            divChangePasswordWithOTP.Visible = true;
                            btnSubmitPasswordChange.Visible = true;
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
                                auth_login_resp.response_code = jsonsplit.response_code;
                                auth_login_resp.response_message = jsonsplit.response_message;
                                lbl_status.Text = auth_login_resp.response_message;
                                return;
                            }
                            catch (Exception ex)
                            {
                                auth_login_resp.response_code = "151";
                                auth_login_resp.response_message = wex.Message;
                                lbl_status.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
                            }
                        }

                    }
                }
            }
        }
    }
}
