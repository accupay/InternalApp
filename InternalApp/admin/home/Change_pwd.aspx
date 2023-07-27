<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change_pwd.aspx.cs" Inherits="InternalApp.admin.home.change_pwd" %>
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
        history.pushState(null, null, 'hgtfcvfp102a3o25t');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'hgtfcvfp102a3o25t');
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
            <h1 class="m-0" style="color:#d9880f;font-size:x-large">Change Password</h1>
          </div><!-- /.col -->
          <%--<div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->--%>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
           <!-- left column -->
          <div class="col-md-10">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header" style="background-color:#d9880f">
                  <div class="box-header" style="color:#d9880f">
              
                    <h1 class="card-title" style="color:white">&nbsp;&nbsp;Password Should Be at Least 8 Characters long with at least 1 lower case, 1 upper case, 1 Number, 1 Special Character</h1>
                </div><!-- /.box-header -->
                <%--<h1 class="card-title" style="color:#d9880f">Change Password</h1>--%>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <%--<form>--%>
                <div class="card-body">
                    <div class="row">

                        <div class="col-xs-12">
                            <div class="alert alert-danger" runat="server" id="divErrorMessage" style="display: none">
                                <strong>!</strong><asp:Label ID="lblErrorMessage" runat="server" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="alert alert-success" id="divSuccessMessage" style="display: none">
                                <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                            </div>
                        </div>
                     <%--<div class="box-header" id="StatusDivSuccess" style="background-color:green;margin-left:12px" runat="server" visible="false" >
                  <h6 class="card-title" style="color:white">
                      <asp:Label runat="server" class="box-title" ID="LblSuccessStatus" ForeColor="white" Font-Bold></asp:Label></h6>
                  
                </div>
                        <div class="box-header" id="StatusDivFail" style="background-color:red;margin-left:12px" runat="server" visible="false">
                  <h6 class="card-title" style="color:white">
                      <asp:Label runat="server" class="box-title" ID="LblFailStatus" ForeColor="white" Font-Bold></asp:Label></h6>
                  
                </div>  --%>
                        </div>
                  <div class="row">
                       <div class="col-md-3">
                           </div>
                      <div class="col-md-6">
                  <div class="form-group" style="margin-bottom: 0px;">
                    <label for="exampleInputPassword1">Old Password</label>
                    <%--  <asp:Label runat="server" class="col-sm-2 control-label" ID="LblNew" Text="Old Password" ></asp:Label>--%>
                  <%--  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Old Password">--%>
                      <asp:TextBox AutoCompleteType="Disabled"  runat="server" type="password" class="form-control" ID="txt_old_pwd" placeholder="Old Password" /> 
                            <asp:RegularExpressionValidator ID="Rgv_old_pwd" runat="server"
                                                    ControlToValidate="txt_old_pwd" ErrorMessage="Enter a Valid Old Password" ForeColor ="red" Font-Size="Medium" 
                                                     ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#*%^-_!&+=]).*$"></asp:RegularExpressionValidator>
  
                  </div>
                      </div>
                        </div>
                      <div class="row">
                           <div class="col-md-3">
                           </div>
                      <div class="col-md-6">
                 <div class="form-group" style="margin-bottom: 0px;">
                    <label for="exampleInputPassword2">New Password</label>
                     <asp:TextBox AutoCompleteType="Disabled"  runat="server" type="password" class="form-control" ID="txt_new_pwd" placeholder="New Password" /> 
                            <asp:RegularExpressionValidator ID="Rev_new_pwd" runat="server"
                                                    ControlToValidate="txt_new_pwd" ErrorMessage="Enter a Valid New Password" ForeColor ="red" Font-Size="Medium" 
                                                     ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#*%^-_!&+=]).*$"></asp:RegularExpressionValidator>

                    
                  </div>
                          </div>
                        </div>
                            <div class="row">
                                 <div class="col-md-3">
                           </div>
                      <div class="col-md-6">
                     <div class="form-group" style="margin-bottom: 0px;">
                    <label for="exampleInputPassword3">ConfirmPassword</label>
                         <asp:TextBox AutoCompleteType="Disabled"  runat="server" type="password" class="form-control" ID="txt_confirm_pwd" placeholder="Confirm Password" /> 
                            <asp:RegularExpressionValidator ID="Rev_confirm_pwd" runat="server"
                                                    ControlToValidate="txt_confirm_pwd" ErrorMessage="Enter a Valid Confirm Password" ForeColor ="red" Font-Size="Medium" 
                                                     ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#*%^-_!&+=]).*$"></asp:RegularExpressionValidator>

                   
                  </div>
                </div>
                        </div>
               <div class="row">
                    <div class="col-md-7">
                           </div>
<div class="col-lg-2">
                                                <div class="form-group">

                                                    <br />

                                                    <div>
                <%--  <button type="submit" class="btn btn-primary">Submit</button>--%>
                    <asp:Button runat="server" ID="btn_submit" ValidationGroup="GroupA" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px;" Text="Submit" OnClick="btn_submit_Click"></asp:Button>
                </div>
                                                    </div>
    </div>
                    </div>
                    </div>
              <%--</form>--%>
            </div>
            <!-- /.card -->

          

          </div>
          <!--/.col (left) -->
          <!-- ./col -->
        </div>
        <!-- /.row -->
     
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 

        <div>
        </div>

           <script type="text/javascript">
               //Common For All Screens
               if ($('#<%= lblErrorMessage.ClientID %>').html() != "") {
                $("#divErrorMessage").css("display", "block");
                setTimeout(function () {
                    $('#divErrorMessage').fadeOut('slow');
                }, 10000);
            }
            if ($('#<%= lblSuccessMessage.ClientID %>').html() != "") {
                   $("#divSuccessMessage").css("display", "block");
                   setTimeout(function () {
                       $('#divSuccessMessage').fadeOut('slow');
                   }, 10000);
               }
        </script>

    </form>
  <uc3:Footer ID="Footer1" runat="server" />
</body>
</html>
