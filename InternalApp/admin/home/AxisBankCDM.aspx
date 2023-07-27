<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AxisBankCDM.aspx.cs" Inherits="InternalApp.admin.home.AxisBankCDM" %>

<%@ Register Src="../../Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="../../Admin_LM.ascx" TagName="Left_Menu" TagPrefix="uc2" %>
<%@ Register Src="../../Footer.ascx" TagName="Footer" TagPrefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Axis Bank CDM</title>
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
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <uc2:Left_Menu ID="LeftMenu1" runat="server" />
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <asp:HiddenField runat="server" ID="hdnValue" />
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="card">
                        <div class="card-header">
                            <h1 class="card-title" style="color: #d9880f; font-size: x-large">Axis CDM Card Mapping</h1>
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
                                    <div class="form_group row">
                                        <div class="col-sm-4">
                                            <asp:RadioButton ID="rbtnMapping" OnCheckedChanged="rbtnChooseType_CheckedChanged" AutoPostBack="true" runat="server" GroupName="a" Text="Mapping" />
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:RadioButton ID="rbtnUnMapping" OnCheckedChanged="rbtnChooseType1_CheckedChanged" AutoPostBack="true" runat="server" GroupName="a" Text="UnMapping" />
                                        </div>
                                    </div>
                                     <div class="form-group row" runat="server" id="divrbtn3">
                                        <label for="inputName" class="col-sm-2 control-label">Card Number*</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txtCardNo" AutoPostBack="true" OnTextChanged="txtCardNo_TextChanged" placeholder="Mobile No" />

                                        </div>
                                    </div>
                                    <div class="form-group row" runat="server" id="divrbtn2">
                                        <label for="inputName" class="col-sm-2 control-label">Account Type</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" ID="ddlAccountType" CssClass="form-control select2">
                                                <asp:ListItem Value="0">Select Account Type</asp:ListItem>
                                                <asp:ListItem Value="1">Retailer</asp:ListItem>
                                                <asp:ListItem Value="2">Distributor</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>                                   
                                    <div class="form-group row" runat="server" id="divrbtn4">
                                        <label for="inputName" class="col-sm-2 control-label">Mobile Number*</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txtMobileNumber" placeholder="Mobile No" />
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
                                            <asp:Button runat="server" ID="btn_search" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px; width: auto;" Text="Search" OnClick="btn_search_Click"></asp:Button>
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
    <uc3:Footer ID="Footer1" runat="server"></uc3:Footer>
</body>
</html>
