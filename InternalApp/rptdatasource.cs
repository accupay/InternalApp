using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using VDAL;

namespace InternalApp
{
    public class rptdatasource
    {
        VDALSQL TransDAL = new VDALSQL(ConfigurationSettings.AppSettings["TransactionDAL"].ToString());
        [WebMethod]
        public DataSet Transaction_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetPaymentTransaction");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet payout_Transaction_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetRetailerPayoutPaymentTransactionReport_Admin  ");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        public DataSet Dist_topup_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetTopupFromDistReport");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        public DataSet Topup_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetTopupReport");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }

        public DataSet DepositeSlip_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetTopupReport_DEPOSITSLIP");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        public DataSet pg_topup_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {
          

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetPGTopupReport");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        public DataSet transaction_ledger_report(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {
          //  public DataSet transaction_ledger_report(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("AccountTypeRefID", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("AccountMobile", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_AdminTransactionLedgerReport");
                return dst;
                
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet AgentApproval_rpt(DateTime fromdate, DateTime todate, string AgentMobileNo)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("fromdate", fromdate));
                Cmd.Parameters.Add(new SqlParameter("todate", todate));
                Cmd.Parameters.Add(new SqlParameter("AgentMobileNo", AgentMobileNo));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetAgentPayee");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet AgentStatusApproval(int AgentPayeeRefID, int AccountValidationStatusRefID, string Comments, int UserRefID)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("AgentPayeeRefID", AgentPayeeRefID));
                Cmd.Parameters.Add(new SqlParameter("AccountValidationStatusRefID", AccountValidationStatusRefID));
                Cmd.Parameters.Add(new SqlParameter("Comments", Comments));
                Cmd.Parameters.Add(new SqlParameter("UserRefID", UserRefID));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_UpdateAgentPayee");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
        [WebMethod]
        public DataSet Recharge_Transaction_rpt(DateTime FrmDate, DateTime Todate, string SearchOption, string SearchValue)
        {

            try
            {
                SqlCommand Cmd = new SqlCommand();
                Cmd.Parameters.Add(new SqlParameter("FromDate", FrmDate));
                Cmd.Parameters.Add(new SqlParameter("ToDate", Todate));
                Cmd.Parameters.Add(new SqlParameter("SearchOption", Convert.ToInt32(SearchOption)));
                Cmd.Parameters.Add(new SqlParameter("SearchValue", SearchValue));
                DataSet dst = TransDAL.GetDataSet(Cmd, "APT_GetRechargeTransactionReport_Admin");
                return dst;
            }
            catch (Exception ex)
            {
                return null;

            }

        }
    }
}