<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="InternalApp.Header1" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Accupayd</title>

  
</head>
<%--<body class="hold-transition sidebar-mini layout-fixed">--%>
  <body>
<div class="wrapper">

  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../home/home.aspx" class="nav-link">Home Page</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact Details</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
     

      <!-- Messages Dropdown Menu -->
      
      <!-- Notifications Dropdown Menu -->
     
      <li class="nav-item">
       <%-- <a class="nav-link" data-widget="fullscreen" href="#" role="button">--%>
        <%--  <asp:Button Text="Sign Out" Runat="server" style="background-color:#d9880f;color:ghostwhite" id="btnsignout" OnClick="btnsignout_Click"/>--%>
           <a style="color:ghostwhite;background-color:#d9880f" href="<%=ResolveUrl("~/admin/home/login.aspx")%>"> Sign Out </a>

         <%-- <i class="fas fa-expand-arrows-alt"></i>--%>
        
      </li>
     
    </ul>
  </nav>

 
</div>
<!-- ./wrapper -->

<!-- jQuery -->

</body>
</html>

