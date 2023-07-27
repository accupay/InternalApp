﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manual_topup.aspx.cs" Inherits="InternalApp.admin.home.manual_topup" %>

<%@ Register Src="../../Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="../../Admin_LM.ascx" TagName="Left_Menu" TagPrefix="uc2" %>
<%@ Register Src="../../Footer.ascx" TagName="Footer" TagPrefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manual Topup</title>
    <link rel="icon" href="../../dist/img/Accupay.png" type="image/x-icon" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- JQVMap -->
    <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
    <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css" />

    <script type="text/javascript">

        function isNumberKey(evt, obj) {

            var charCode = (evt.which) ? evt.which : evt.keyCode
            var value = obj.value;
            var dotcontains = value.indexOf(".") != -1;
            if (dotcontains)
                if (charCode == 46) return false;
            if (charCode == 46) return true;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }



    </script>
<script type="text/javascript">
    function DisableBackButton() { window.history.forward(); }
    setTimeout("DisableBackButton()", 0);
    window.onunload = function () { null };
</script> 
    <script type = "text/javascript" >
        history.pushState(null, null, 'vbnvb454g553ghfg');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'vbnvb454g553ghfg');
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
                        <%-- <div class="col-sm-6">
            <h1 class="m-0">Welcome</h1>
          </div>--%><!-- /.col -->
                        <%--<div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->--%>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="card">
                        <div class="card-header">
                            <h1 class="card-title" style="color: #d9880f; font-size: x-large">Manual Topup</h1>
                        </div>
                        <!-- /.card-header -->
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
                            </div>
                            <div class="tab-pane" id="settings">
                                <div class="form-horizontal">
                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 col-form-label">Mobile Number *</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txt_mobile_no" placeholder="Mobile No" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" MaxLength="10" OnTextChanged="txt_mobile_no_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Merchant Type *</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ReadOnly="true" ID="txt_merchant_type" placeholder="Merchant Type" ></asp:TextBox>
                                        </div>

                                        <label id="lblbalance" for="inputName" style="padding-left: 5%;" class="col-sm-2 control-label">Current Balance</label>
                                        <div class="col-sm-3">
                                            <asp:Label runat="server" class="form-control" ID="lbl_balance" placeholder=""></asp:Label>
                                        </div>

                                    </div>
                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Agency Name *</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ReadOnly="true" ID="txt_agency_name" placeholder="Agency Name" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Bank *</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddl_bank">
                                              <%--  <asp:ListItem Value="0" Text="Select Bank"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Top Up Type *</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="DDLTopUpType">
                                                <%--<asp:ListItem Value="0" Text="Select Topup Type"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Bank Transaction ID *</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txt_trans_id" placeholder="Transaction ID" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Amount *</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txt_Amt" onkeypress="return isNumberKey(event,this)" placeholder="Amount" MaxLength="10"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="inputExperience" class="col-sm-2 control-label">Remarks</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txt_remarks" placeholder="Remarks" MaxLength="100"></asp:TextBox>
                                        </div>
                                    </div>

                                   
                                    <br />

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">

                                        <br />

                                        <div>
                                            <%--  <button type="submit" class="btn btn-primary">Submit</button>--%>
                                            <asp:Button runat="server" ID="BtnUpdate" OnClick="BtnUpdate_Click" Style="background-color: #d9880f; border-color: #d9880f;" Text="Top UP" class="btn btn-danger"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
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
