<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PGTopupCredit.aspx.cs" Inherits="InternalApp.admin.home.PGTopupCredit" %>

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
                <asp:HiddenField runat="server" ID="hdnrbtnvalue" />
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="card">
                        <div class="card-header">
                            <h1 class="card-title" style="color: #d9880f; font-size: x-large">PG Topup Credit</h1>
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
                                            <asp:RadioButton ID="rbtnChooseType" OnCheckedChanged="rbtnChooseType_CheckedChanged" AutoPostBack="true" runat="server" GroupName="a" Text="Cash Free" />
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:RadioButton ID="rbtnChooseType1" OnCheckedChanged="rbtnChooseType1_CheckedChanged" AutoPostBack="true" runat="server" GroupName="a" Text="Razor Pay" />
                                        </div>
                                    </div>
                                    <div class="form-group row" runat="server" id="divrbtn2">
                                        <label for="inputName" class="col-sm-2 control-label">Vendor Order ID*</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txtVendorOrderID" placeholder="Vendor Order ID"></asp:TextBox>
                                        </div>
                                         </div>
                                    <div class="form-group row" runat="server" id="divrbtn3">
                                        <label for="inputName" class="col-sm-2 control-label">Vendor Payment ID*</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txtVendorPaymentID" placeholder="Vendor Payment ID"></asp:TextBox>
                                        </div>
                                         </div>
                                    <div class="form-group row" runat="server" id="divrbtn4">
                                        <label for="inputName" class="col-sm-2 control-label">Vendor Reference Number*</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" class="form-control" ID="txtVenorReferenceNo" placeholder="Vendor Reference No"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Topup Type *</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlTopupType">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Card Type *</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCardType">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputName" class="col-sm-2 control-label">Card Sub-Type *</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCardSubType">
                                            </asp:DropDownList>
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
                                            <asp:Button runat="server" ID="BtnUpdate" OnClick="BtnUpdate_Click" Style="background-color: #d9880f; border-color: #d9880f;" Text="Submit" class="btn btn-danger"></asp:Button>
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
