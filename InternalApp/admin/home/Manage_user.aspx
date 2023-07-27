<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage_user.aspx.cs" Inherits="InternalApp.admin.home.Manage_user" %>

<%@ Register src="../../Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="../../Admin_LM.ascx" tagname="Left_Menu" tagprefix="uc2" %>
<%@ Register src="../../Footer.ascx" tagname="Footer" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Home</title>
   <link rel = "icon" href = "../../dist/img/Accupay.png" type = "image/x-icon"/>

   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"/>
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>
  <!-- iCheck -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>
  <!-- JQVMap -->
  <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css"/>
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css"/>
  <!-- summernote -->
  <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css"/>
<script type="text/javascript">
    function DisableBackButton() { window.history.forward(); }
    setTimeout("DisableBackButton()", 0);
    window.onunload = function () { null };
</script> 
    <script type = "text/javascript" >
        history.pushState(null, null, 'vhgtr34ty4rtgfgf3g');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'vhgtr34ty4rtgfgf3g');
        });
    </script>
</head>
<body>
    <script type = "text/javascript">  
        window.onload = function () {
            document.onkeydown = function (e) {
                return (e.which || e.keyCode) != 116;
            };
        }
    </script> 
    <form id="form1" runat="server">
      <uc1:Header ID="Header1" runat="server" />
      <uc2:Left_Menu ID="LeftMenu1" runat="server" />
      <%--  <uc1:Header ID="Header1" runat="server" />--%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
           <%-- <h1 class="m-0">Welcome</h1>--%>
          </div><!-- /.col -->
        
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
   <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h1 class="card-title" style="color:#d9880f;font-size:x-large">Manage Users</h1>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead style="background-color:#d9880f;color:white">
                  <tr>
                    <th>S_No.</th>
                    <th>Name</th>
                    <th>Mobile No.</th>
                    <th>User Group</th>
                    <th>Department</th>
                    <th>Designation</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <%for (int i = 0; i < ds_manage_user.Tables[0].Rows.Count; i++)
                                  {
                              %>
                              <td><%=(i + 1).ToString() %></td>
                              <td><%=ds_manage_user.Tables[0].Rows[i]["FirstName"].ToString() %></td>
                              <td><%=ds_manage_user.Tables[0].Rows[i]["Mobilenumber"].ToString() %></td>
                              <td><%=ds_manage_user.Tables[0].Rows[i]["UserGroup"].ToString() %></td>
                              <td><%=ds_manage_user.Tables[0].Rows[i]["Department"].ToString() %></td>
                              <td><%=ds_manage_user.Tables[0].Rows[i]["Designation"].ToString() %></td>
                               </tr>
                            
                              <%}%>
                 
                  </tbody>
                  <tfoot style="background-color:#d9880f;color:white">
                  <tr>
                      <th>S_No.</th>
                    <th>Name</th>
                    <th>Mobile No.</th>
                    <th>User Group</th>
                    <th>Department</th>
                    <th>Designation</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

       
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>

     <%-- <section class="content">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Manage Users</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
        

            <asp:Panel ID="pnl" runat="server" ScrollBars="Both" Height="500px">

                                            <asp:GridView ID="grd_manage_user" runat="server" class="table" HeaderStyle-CssClass="k-header" GridLines="Both" HeaderStyle-BackColor="#009999" BorderColor="#009999"
                                                ShowHeaderWhenEmpty="true" HeaderStyle-ForeColor="White" AutoGenerateColumns="true">                                                
                                              
                                                    <EmptyDataTemplate>
                                                    ------------------No Record Found--------------------
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </asp:Panel>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>--%>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 

        <div>
        </div>
    </form>
  <uc3:Footer ID="Footer1" runat="server" />
</body>
</html>

