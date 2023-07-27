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

namespace InternalApp
{
    public partial class Header1 : System.Web.UI.UserControl
    {
        private static string session_validation = ConfigurationManager.AppSettings["SessionValidation"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ValidateSession()
        {
            try
            {
                
                string ip = Utilities.GetMacIP(Request);
                Session["sys_IP"] = ip;
                string MacID = Utilities.GetMacDetails(Request, Response);
                Session["mac_id"] = MacID;
                
                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(delegate { return true; });
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                var httpWebRequest = (HttpWebRequest)WebRequest.Create(session_validation);
                httpWebRequest.ContentType = "application/json; charset=utf-8";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string auth_Reg = new JavaScriptSerializer().Serialize(new
                    {

                        ip= Session["sys_IP"].ToString(),
                        sid= Session["sid"].ToString(),
                        macID= Session["mac_id"].ToString()
                        
                    });
                    streamWriter.Write(auth_Reg);
                    streamWriter.Flush();
                    streamWriter.Close();

                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        var jsonRes = streamReader.ReadToEnd();
                        dynamic jsonsplit = JObject.Parse(jsonRes);
                        //auth_login_resp.response_code = jsonsplit.response_code;
                        //auth_login_resp.response_message = jsonsplit.response_message;
                        //if (auth_login_resp.response_code == "200")  //Success
                        //{
                        //    lbl_status.Text = "Password Changed. Please login now.";
                        //    txt_pwd.Text = "";
                        //    div_login.Visible = true;
                        //    divAdminChangePassword.Visible = false;
                        //    btnSubmitResetPasswordChange.Visible = false;
                        //    txt_uid.ReadOnly = false;
                        //}
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
                           // { "response_code":"100","response_message":"Valid Session.","data":{ "session_id":"10761","token_id":"170584","sid":"aP34ob82TdKVuf3bSxOBfA=="} }
                            try
                            {
                                dynamic jsonsplit = JObject.Parse(error);
                                //auth_login_resp.response_code = jsonsplit.response_code;
                                //auth_login_resp.response_message = jsonsplit.response_message;
                                //lbl_status.Text = auth_login_resp.response_message;
                                if (jsonsplit.response_code == "100")
                                {
                                    Session["sid"] = jsonsplit.data.sid;
                                    Session["token_id"] = jsonsplit.data.token_id;
                                    Session["session_id"] = jsonsplit.data.session_id;
                                }
                                else
                                {
                                    {
                                        Response.Redirect("../home/login.aspx");
                                    }
                                }
                                return;
                            }
                            catch (Exception ex)
                            {
                                //auth_login_resp.response_code = "151";
                                //auth_login_resp.response_message = wex.Message;
                                //lbl_status.Text = "Unexpected Issue Occured, Please Connect Your Administrator";
                            }
                        }

                    }
                }
            }
        }
    

    protected void btnsignout_Click(object sender, EventArgs e)
    {
      Response.Redirect("../home/login.aspx");
    }
  }
}
