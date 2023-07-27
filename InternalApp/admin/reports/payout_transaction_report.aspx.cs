using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InternalApp.admin.reports
{
    public partial class payout_transaction_report : System.Web.UI.Page
    {
        rptdatasource ds = new rptdatasource();
        protected void Page_Load(object sender, EventArgs e)
        {
            // FDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            //ToDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            Header1.ValidateSession();
        }

        protected void btnSubmitPasswordChange_Click(object sender, EventArgs e)
        {

        }
        private void BindGrid()
        {
            try
            {
                grd_payout_transaction_report.Visible = true;
                grd_payout_transaction_report.DataSource = ds.payout_Transaction_rpt(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text), DDL_Search.SelectedValue, txt_searchvalue.Text);
                grd_payout_transaction_report.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            try
            {

                if (FDate.Text != "" & ToDate.Text != "")
                {
                    GridView grdiew = new GridView();
                    grdiew.DataSource = ds.payout_Transaction_rpt(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text), DDL_Search.SelectedValue, txt_searchvalue.Text);
                    grdiew.DataBind();
                    Response.ClearContent();
                    Response.Buffer = true;
                    Response.AddHeader("Content-disposition", string.Format("attachement; filename={0}", "payout_Transaction_Report.xls"));
                    Response.ContentType = "application/ms-excel";
                    StringWriter sw1 = new StringWriter();
                    HtmlTextWriter html1 = new HtmlTextWriter(sw1);
                    grdiew.RenderControl(html1);
                    Response.Write(sw1.ToString());
                    Response.End();
                    // btnExcel.Visible = true;
                    //  BtnShow.Visible = true;

                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void grd_payout_transaction_report_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grd_payout_transaction_report.PageIndex = e.NewPageIndex;
                this.BindGrid();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
