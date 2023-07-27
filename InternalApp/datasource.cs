using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using VDAL;
using System.Xml.Linq;

namespace InternalApp
{

    public class datasource
    {
        VDALSQL DAL = new VDALSQL();
        VDALSQL MasterDAL = new VDALSQL(ConfigurationSettings.AppSettings["MasterDAL"].ToString());
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());

        [WebMethod]
        public admin_info_resp admin_info(string mobile_no)
        {
            admin_info_resp admin_info = new admin_info_resp();

            if (!Utilities.FieldValidation(true, 10, mobile_no.ToCharArray(), "n", ""))
            {
                admin_info.response_code = "101";
                admin_info.response_description = "Invalid Mobile Number";
                return admin_info;
            }
            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("MobileNumber", mobile_no));
                Cmd.Parameters.Add(new SqlParameter("admrefid", "1"));

                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_StaffLookup");
                if (dst != null && dst.Tables[0].Rows.Count > 0)
                {
                    //if (dst.Tables[0].Rows[0][0].ToString() == "0")
                    //{
                    admin_info.staff_ref_id = dst.Tables[0].Rows[0]["StaffRefid"].ToString();
                    admin_info.mobile_no = dst.Tables[0].Rows[0]["Mobilenumber"].ToString();
                    admin_info.first_name = dst.Tables[0].Rows[0]["Firstname"].ToString();
                    admin_info.last_name = dst.Tables[0].Rows[0]["Lastname"].ToString();
                    admin_info.usergroup_ref_id = dst.Tables[0].Rows[0]["UserGrouprefid"].ToString();
                    admin_info.dob = dst.Tables[0].Rows[0]["Dataofbirth"].ToString();
                    admin_info.active_status = dst.Tables[0].Rows[0]["Activestatus"].ToString();
                    admin_info.response_code = "0";
                    admin_info.response_description = "Success";
                    // }
                    //else
                    //{
                    //  admin_info.response_code = "101";
                    //  admin_info.response_description = "Invalid Mobile Number";
                    //}

                }
                else
                {
                    admin_info.response_code = "101";
                    admin_info.response_description = "Invalid Mobile Number";
                }
                return admin_info;
            }
            catch (Exception ex)
            {
                admin_info.response_code = "-1";
                admin_info.response_description = "Unable to process, Please try later";
                return admin_info;
            }

        }

        [WebMethod]
        public partner_type_resp partner_type_config(string mobile_no)
        {
            partner_type_resp merchant_type_info = new partner_type_resp();

            if (!Utilities.FieldValidation(true, 10, mobile_no.ToCharArray(), "n", ""))
            {
                merchant_type_info.response_code = "101";
                merchant_type_info.response_description = "Invalid Mobile Number";
                return merchant_type_info;
            }
            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("mobilenumber", mobile_no));
                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_GetRetailerPartnerType");

                if (dst != null && dst.Tables[0].Rows.Count > 0)
                {
                    if (dst.Tables[0].Rows[0][0].ToString() != null)
                    {


                        merchant_type_info.retailer_ref_id = dst.Tables[0].Rows[0]["Retailerrefid"].ToString();
                        merchant_type_info.retailer_name = dst.Tables[0].Rows[0]["RetailerName"].ToString();
                        merchant_type_info.mobile_number = dst.Tables[0].Rows[0]["Mobilenumber"].ToString();
                        merchant_type_info.partner_description = dst.Tables[0].Rows[0]["PartnerDescription"].ToString();
                        merchant_type_info.response_code = "0";
                        merchant_type_info.response_description = "Success";
                    }
                    else
                    {
                        merchant_type_info.response_code = "101";
                        merchant_type_info.response_description = "Invalid Mobile Number";
                        //merchant_type_info.response_code = dst.Tables[0].Rows[0]["ResponseCode"].ToString(); ;
                        //merchant_type_info.response_description = dst.Tables[0].Rows[0]["ResponseDescription"].ToString(); ;
                    }
                }
                else
                {
                    merchant_type_info.response_code = "101";
                    merchant_type_info.response_description = "Invalid Mobile Number";
                }
                return merchant_type_info;
            }
            catch (Exception ex)
            {
                merchant_type_info.response_code = "-1";
                merchant_type_info.response_description = "Unable to process, Please try later";
                return merchant_type_info;
            }

        }




        [WebMethod]
        public merchant_info_resp Merchant_info(string mobile_no)
        {
            merchant_info_resp merchant_info = new merchant_info_resp();

            if (!Utilities.FieldValidation(true, 10, mobile_no.ToCharArray(), "n", ""))
            {
                merchant_info.response_code = "101";
                merchant_info.response_description = "Invalid Mobile Number";
                return merchant_info;
            }
            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("MobileNo", mobile_no));
                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_GetDetails_MobileNo");
                // merchant_info.response_description = "Invalid Mobile Number1";
                if (dst != null && dst.Tables[0].Rows.Count > 0)
                {
                    if (dst.Tables[0].Rows[0][0].ToString() == "0")
                    {
                        merchant_info.account_type_ref_id = dst.Tables[0].Rows[0]["AccountTypeRefID"].ToString();
                        merchant_info.agency_name = dst.Tables[0].Rows[0]["AgencyName"].ToString();
                        merchant_info.current_balance = dst.Tables[0].Rows[0]["CurrentBalance"].ToString();
                        merchant_info.response_code = "0";
                        merchant_info.response_description = "Success";
                    }
                    else
                    {
                        merchant_info.response_code = dst.Tables[0].Rows[0]["ResponseCode"].ToString(); ;
                        merchant_info.response_description = dst.Tables[0].Rows[0]["ResponseDescription"].ToString(); ;
                    }
                }
                else
                {
                    merchant_info.response_code = "101";
                    merchant_info.response_description = "Invalid Mobile Number";
                }
                return merchant_info;
            }
            catch (Exception ex)
            {
                merchant_info.response_code = "-1";
                merchant_info.response_description = "Unable to process, Please try later";
                return merchant_info;
            }

        }

        [WebMethod]
        public DataSet manage_users()
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_ManageUsers");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }

        [WebMethod]
        public DataSet get_bank_list()
        {

            try
            {
                SqlCommand banklist = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(banklist, "APT_GetBank");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet topup_type()
        {

            try
            {
                SqlCommand topuptype = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(topuptype, "APT_GetTopuptype");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet get_pg_link_bank()
        {

            try
            {
                SqlCommand pglinkbank = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(pglinkbank, "APT_CURRTNEPGBANK");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet get_pg_bank()
        {

            try
            {
                SqlCommand pgbank = new SqlCommand();
                DataSet dst = TransDAL.GetDataSet(pgbank, "GETPayoutBankMaster");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet Depositslip_type()
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_GetTopuptype_DepositSlip");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }

        [WebMethod]
        public DataSet Depositslip_bank_list()
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(Cmd, "APT_GetDepositslipBank");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet get_Depositslip_upload_dtls(int type_refid, int bank_ref_id, string Amount)
        {
            //int dep_amount;
            if (string.IsNullOrEmpty(Amount))
            {
                Amount = "0";
            }

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("TopupTypeRefID", type_refid));
                Cmd.Parameters.Add(new SqlParameter("DepositBankRefID", bank_ref_id));
                Cmd.Parameters.Add(new SqlParameter("Amount", Convert.ToDouble(Amount)));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetDepositSlip");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }
        }

        [WebMethod]
        public DataSet Depositslip_Status_Update(int DepositSlipRefID, int ApproveStatus, int UserRefID, string Comments)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("DepositSlipRefID", DepositSlipRefID));
                Cmd.Parameters.Add(new SqlParameter("ApproveStatus", ApproveStatus));      //2-success ,3-Failure
                Cmd.Parameters.Add(new SqlParameter("UserRefID", UserRefID));
                Cmd.Parameters.Add(new SqlParameter("Comments", Comments));

                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_UpdateDepositSlipStatus");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }


        }

        [WebMethod]
        public DataSet get_Card_type_list()
        {

            try
            {
                SqlCommand banklist = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(banklist, "APT_GetCardBrand");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }

        [WebMethod]
        public DataSet get_Card_sub_type_list()
        {

            try
            {
                SqlCommand banklist = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(banklist, "APT_GetCardSubtype");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }

        [WebMethod]
        public DataSet get_topup_type_list()
        {

            try
            {
                SqlCommand banklist = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(banklist, "AptTopuptypeCredit");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        public DataSet get_rc_VendorList()
        {

            try
            {
                SqlCommand pgbank = new SqlCommand();
                DataSet dst = MasterDAL.GetDataSet(pgbank, "APT_GetRechargeVendor");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        public DataSet get_rc_comm_operatorlist()
        {

            try
            {
                SqlCommand pgbank = new SqlCommand();
                DataSet dst = TransDAL.GetDataSet(pgbank, "APT_GetRechargeCommission");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
    }


    public class admin_info_resp
    {
        //StaffRefid,Empcode,Mobilenumber,Firstname,Lastname,DesginationRefid,Departmentrefid,UserGrouprefid,Dataofbirth,Dataofjoin,Activestatus,blockstatus
        public string staff_ref_id { get; set; }
        public string emp_code { get; set; }
        public string mobile_no { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string desgination_ref_id { get; set; }
        public string department_ref_id { get; set; }
        public string usergroup_ref_id { get; set; }
        public string dob { get; set; }
        public string active_status { get; set; }
        public string block_status { get; set; }
        public string response_code { get; set; }
        public string response_description { get; set; }
    }
    public class partner_type_resp
    {
        public string response_code { get; set; }
        public string response_description { get; set; }
        public string retailer_ref_id { get; set; }
        public string retailer_name { get; set; }
        public string mobile_number { get; set; }
        public string partner_description { get; set; }

    }
    public class merchant_info_resp
    {
        public string response_code { get; set; }
        public string response_description { get; set; }
        public string account_type_ref_id { get; set; }
        public string account_ref_id { get; set; }
        public string dist_ref_id { get; set; }
        public string agency_name { get; set; }
        public string current_balance { get; set; }
    }
}
