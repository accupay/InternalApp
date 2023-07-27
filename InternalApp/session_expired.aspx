<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="session_expired.aspx.cs" Inherits="InternalApp.session_expired" %>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Session Expired</title>
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
<div class="login-box" style="width:500px">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary" style="border-top: 3px solid #d9880f" id="div_login" runat="server">
    <div class="card-header text-center">
<%--      <a  class="h1"><b>Admin</b></a>--%>
       <b>
                    <img src="<%=ResolveUrl("dist/img/Accupayd.png") %>" width="80%" height="80%" /></b>
    </div>
    <div class="card-body">
      <%-- <a  class="h1"><b>Admin</b></a>--%>
      <p class="login-box-msg" style="font-size:25px;Color:#d9880f"><b>Session Expired / Invalid Operation</b></p>
      <asp:Label runat="server" ID="lbl_status" Text="" ForeColor="Red"></asp:Label>
     



        

                <div class="form-group has-feedback">
                    <asp:Label runat="server" Text="Session expired / an invalid operation has been detected. Please login again to continue the operation."></asp:Label>
                </div>
           <div class="form-group has-feedback" style="text-align:center">
<%--                    <asp:Button runat="server" ID="btnRedirect" Text="Click here to login" style="margin-left: 75px;" class="btn btn-primary btn-rev btn-primary-with-icon margin-R10"  OnClick="btnRedirect_Click"></asp:Button>--%>
<%--                        <asp:LinkButton runat="server" CssClass="pull-right" ID="btn_redirect" style="color:#d9880f; font-size:20px" OnClick="btn_redirect_Click" Text="Click here to login"></asp:LinkButton>--%>

           </div>



       
       
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
  
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