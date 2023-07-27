<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="InternalApp.admin.home.login" %>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>
   <link rel = "icon" href = "../../dist/img/Accupay.png" type = "image/x-icon"/>
  

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page" >
   <form runat="server">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary" style="border-top: 3px solid #d9880f" id="div_login" runat="server">
    <div class="card-header text-center">
<%--      <a  class="h1"><b>Admin</b></a>--%>
       <b>
                    <img src="<%=ResolveUrl("../../dist/img/Accupayd.png") %>" width="100%" height="100%" /></b>
    </div>
    <div class="card-body">
      <%-- <a  class="h1"><b>Admin</b></a>--%>
      <p class="login-box-msg" style="font-size:40px;Color:#d9880f"><b>Admin</b></p>
      <asp:Label runat="server" ID="lbl_status" Text="" ForeColor="Red"></asp:Label>
     
        <div class="input-group mb-3">
         <%-- <input type="email" class="form-control" placeholder="Email">--%>
           <asp:TextBox autocomplete="smartystreets" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" Text="" placeholder="MobileNumber" ID="txt_uid" MaxLength="10"></asp:TextBox>
  
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-mobile"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <%--<input type="password" class="form-control" placeholder="Password">--%>
          <asp:TextBox autocomplete="nope" type="password" class="form-control" placeholder="Password" runat="server" ID="txt_pwd"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
          
          </div>
          <!-- /.col -->
          <div class="col-4">
            <asp:Button runat="server" ID="BtnSubmit" class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f" Text="Sign In" OnClick="BtnSubmit_Click"></asp:Button>
         
          </div>
         
        </div>
     

      <p class="mb-1">
        <asp:LinkButton runat="server" CssClass="pull-right" ID="lnk_btn_FgtPwd" style="color:#d9880f" OnClick="lnk_btn_FgtPwd_Click" Text="Forgot Password"></asp:LinkButton>
         
       <%-- <a href="forgot-password.html" style="Color:#d9880f">forgot password</a>--%>
      </p>
     <%-- <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p>--%>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
   <div class="card card-outline card-primary" style="border-top: 3px solid #d9880f" id="divAdminChangePassword" runat="server" visible="false">
              <div class="card-header text-center">

       <b>
                    <img src="<%=ResolveUrl("../../dist/img/Accupayd.png") %>" width="100%" height="100%"  /></b>
    </div>
      <div class="card-body">
                <div class="box-header with-border">
                  <p class="login-box-msg" style="font-size:30px;Color:#d9880f"><b>Admin</b></p>
                    <h3 class="box-title text-aqua" style="margin-left: 70px; font-size: 20px; Color:#d9880f">Change Password</h3>

                    <asp:Label runat="server" ID="lblChangePasswordStatus" Text="" ForeColor="Red"></asp:Label>
                    <asp:HiddenField ID="hdnChangePasswordStaffId" runat="server" Visible="false" />
                </div>
                <!-- /.box-header -->
                <div class="form-group has-feedback">
                    <asp:TextBox AutoCompleteType="Disabled" autocomplete="Disabled" runat="server" Enabled="false" class="form-control" Text="" placeholder="UID" ID="txtPasswordChangeUID" MaxLength="10"></asp:TextBox>
                    <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback" id="divChangePasswordWithOTP" runat="server" visible="false">
                    <asp:TextBox AutoCompleteType="Disabled" autocomplete="Disabled" type="password" runat="server" class="form-control" Text="" placeholder="OTP" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" ID="txtPasswordChangeOTP" MaxLength="10"></asp:TextBox>
                    <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback" id="divChangePasswordWithOldPassword" runat="server" visible="false">
                    <asp:TextBox AutoCompleteType="Disabled" autocomplete="Disabled" type="password" runat="server" class="form-control" Text="" placeholder="Old Password" ID="txtOldPassword"></asp:TextBox>
                    
                </div>
        
                <!-- /.box-header -->
                <div class="form-group has-feedback">
                    <asp:TextBox AutoCompleteType="Disabled" autocomplete="nope" type="password" runat="server" class="form-control" Text="" placeholder="New Password" ID="txtNewPassword"></asp:TextBox>
                     
         
                    <asp:RegularExpressionValidator ID="RgvName" runat="server" ValidationGroup="GroupA"
                        ControlToValidate="txtNewPassword" ErrorMessage="Enter a Valid Password" ForeColor="red" Font-Size="Medium"
                        ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#*%^-_!&+=]).*$"></asp:RegularExpressionValidator>
                  <br/>
                <%--</div>
        
                <div class="form-group has-feedback">--%>
                    <asp:TextBox AutoCompleteType="Disabled" autocomplete="nope" type="password" class="form-control" placeholder="Confirm New Password" runat="server" ID="txtConfirmNewPassword"></asp:TextBox>
                    
                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                        ControlToValidate="txtConfirmNewPassword"
                        CssClass="ValidationError"
                        ControlToCompare="txtNewPassword"
                        ErrorMessage="Password Does Not Match"
                        ToolTip="Password must be the same" />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="GroupA"
                        ControlToValidate="txtConfirmNewPassword" ErrorMessage="Enter a Valid Password" ForeColor="red" Font-Size="Medium"
                        ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#*%^-_!&+=]).*$"></asp:RegularExpressionValidator>
                
                <div class="row">
                    <div class="col-md-6">
                        <asp:Button runat="server" ID="btnSubmitPasswordChange" ValidationGroup="GroupA" class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f" Text="Change Password" OnClick="btnSubmitPasswordChange_Click"></asp:Button>
                        <asp:Button runat="server" ID="btnSubmitResetPasswordChange" Visible="false" ValidationGroup="GroupA" class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f" Text="Reset Password" OnClick="btnSubmitResetPasswordChange_Click"></asp:Button>
                    </div>
                    <div class="col-md-6">
                        <asp:Button runat="server" ID="btnSubmitPasswordBack" class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f" Text="Back" OnClick="btnSubmitPasswordBack_Click"></asp:Button>
                    </div>
                </div>
                  </div>
             
     </div>
</div>
     </div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
   </form>
</body>
</html>
