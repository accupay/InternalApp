using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InternalApp
{
  public partial class distheader : System.Web.UI.UserControl
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsignout_Click(object sender, EventArgs e)
    {
      Response.Redirect("../home/distlogin.aspx");
    }
  }
}
