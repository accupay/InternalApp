using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InternalApp.admin.reports
{
    public partial class transaction_ledger_report : System.Web.UI.Page
    {
        rptdatasource ds = new rptdatasource();
        protected void Page_Load(object sender, EventArgs e)
        {
            Header1.ValidateSession();
            // FDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            //ToDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";
        }

        protected void btnSubmitPasswordChange_Click(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txt_searchvalue.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    return;
                }
                else if (txt_searchvalue.Text == "" || !Utilities.FieldValidation(true, 10, txt_searchvalue.Text.ToCharArray(), "n", ""))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    return;
                }

                this.BindGrid();
            }
            catch (Exception ex)
            {
            }

        }
        private void BindGrid()
        {
            try
            {

                grd_transaction_report.Visible = true;
                grd_transaction_report.DataSource = ds.transaction_ledger_report(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text), DDL_Search.SelectedValue, txt_searchvalue.Text);
                //grd_transaction_report.DataSource = ds.transaction_ledger_report(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text));
                grd_transaction_report.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrEmpty(txt_searchvalue.Text))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    return;
                }
                else if (txt_searchvalue.Text == "" || !Utilities.FieldValidation(true, 10, txt_searchvalue.Text.ToCharArray(), "n", ""))
                {
                    lblErrorMessage.Text = "Enter a Valid Mobile No";
                    return;
                }

                if (FDate.Text != "" & ToDate.Text != "")
                {
                    GridView grdiew = new GridView();
                    grdiew.DataSource = ds.transaction_ledger_report(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text), DDL_Search.SelectedValue, txt_searchvalue.Text);
                    //grdiew.DataSource = ds.transaction_ledger_report(Convert.ToDateTime(FDate.Text), Convert.ToDateTime(ToDate.Text));
                    grdiew.DataBind();
                    Response.ClearContent();
                    Response.Buffer = true;
                    Response.AddHeader("Content-disposition", string.Format("attachement; filename={0}", "Transaction_Ledger_Report.xls"));
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
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grd_transaction_report.PageIndex = e.NewPageIndex;
                this.BindGrid();
            }
            catch (Exception ex)
            {
            }
        }
    }
}