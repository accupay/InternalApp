using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static InternalApp.datasource;

namespace InternalApp.admin.home
{
    public partial class test : System.Web.UI.Page
    {
        admin_info_resp testing = new admin_info_resp();
        datasource datasource = new datasource();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
        new DataColumn("student_Id")
        ,new DataColumn("Month_Name")
        ,new DataColumn("Amount")
        ,new DataColumn("IsPaid")
        ,new DataColumn("date")
    });

            dt.Rows.Add(1, "Jan", 5200, "Yes", DateTime.Now.AddDays(-263));
            dt.Rows.Add(2, "Feb", 6500, "No", DateTime.Now.AddDays(-50));
            dt.Rows.Add(3, "Mar", 7500, "", "");
            dt.Rows.Add(4, "Apr", 6333, "No", DateTime.Now.AddDays(-63));
            dt.Rows.Add(5, "Jun", 15000, "Yes", DateTime.Now.AddDays(-93));
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Display(object sender, EventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
                GridViewRow row = GridView1.Rows[rowIndex];

                lblstudentid.Text = (row.FindControl("lblstudent_Id") as Label).Text;
                lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
                txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }
            catch (Exception ex)
            {
            }
        }
        //protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        //{
        //    int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        //    GridViewRow row = GridView1.Rows[rowIndex];

        //    lblstudentid.Text = (row.FindControl("lblstudent_Id") as TextBox).Text;
        //    lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        //    txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
        //}

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Your Saving code.
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;

                //int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
                GridViewRow row = GridView1.Rows[rowindex];

                lblstudentid.Text = (row.FindControl("lblstudent_Id") as Label).Text;
                lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text;
                txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
                // ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#mymodal').modal('show');</script>", false);
            }
            catch (Exception ex)
            {
            }
        }
    }
}
