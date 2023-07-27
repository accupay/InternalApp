<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deposit_Slip_Approval.aspx.cs" Inherits="InternalApp.admin.home.Deposit_Slip_Approval" %>

<%@ Register Src="../../Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="../../Admin_LM.ascx" TagName="Left_Menu" TagPrefix="uc2" %>
<%@ Register Src="../../Footer.ascx" TagName="Footer" TagPrefix="uc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accupayd</title>
    <link rel="icon" href="../../dist/img/Accupay.png" type="image/x-icon" />

    <!-- Google Font: Source Sans Pro -->
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

    <!-- summernote -->
    <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css" />



    <!-- DataTables -->
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />
    <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />

    <!--Datepicker-->
    <%--<link href="../../css/bootstrap.min.css" rel="stylesheet"/>--%>
    <link href="../../css/jquery-customselect-1.9.1.css" rel="stylesheet" />
    <link href="../../css/jquery-ui.min.css" rel="stylesheet" />
   <%-- <link href="../../css/asRange.min.css" rel="stylesheet" />--%>
    <link href="../../css/jquery.timepicker.css" rel="stylesheet" />
    <link href="../../css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../../css/flexslider.css" rel="stylesheet" />
    <%--  <link href="../../css/style-changed.css" rel="stylesheet" />--%>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }
    </style>
<script type="text/javascript">
    function DisableBackButton() { window.history.forward(); }
    setTimeout("DisableBackButton()", 0);
    window.onunload = function () { null };
</script> 
    <script type = "text/javascript" >
        history.pushState(null, null, 'hgtfcvfbnvhgo25t');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'hgtfcvfbnvhgo25t');
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
        <asp:ScriptManager runat="server" ID="Ejdjd"></asp:ScriptManager>
        <uc1:Header ID="Header1" runat="server" />
        <uc2:Left_Menu ID="LeftMenu1" runat="server" />
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h1 class="card-title" style="color: #d9880f; font-size: x-large">Deposit Slip Approval</h1>
                                </div>
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
                            <div class="card-header">
                                <div class="form-group">
                                    <div class="row">

                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label>Top Up Type</label>

                                                <asp:DropDownList runat="server" ID="ddl_topup_type" CssClass="form-control select2">
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label>Deposit Bank</label>

                                                <asp:DropDownList runat="server" ID="ddl_dep_bank_name" CssClass="form-control select2">
                                                </asp:DropDownList>


                                            </div>
                                        </div>

                                        <div class="col-lg-3">
                                            <div class="form-group">

                                                <label>Amount</label>
                                                <asp:TextBox AutoCompleteType="Disabled" runat="server" class="form-control" ID="txt_Amount" placeholder="Amount" />

                                            </div>
                                        </div>
                                        <div class="col-lg-1">
                                            <div class="form-group">
                                                <br />
                                                <div>
                                                    <asp:Button runat="server" ID="btn_search" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px;" Text="Search" OnClick="btn_search_Click"></asp:Button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-1">
                                            <div class="form-group">

                                                <br />

                                                <%--  <div>
                              <asp:Button runat="server" ID="btn_excel"  class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f;margin-top: 8px;" Text="Download" OnClick="btn_excel_Click"></asp:Button>
                  
                              
                              </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <asp:HiddenField runat="server" ID="hdndep_slip" />
                                <asp:HiddenField runat="server" ID="hdnStatusValue" />
                                <asp:HiddenField runat="server" ID="hdnAmt" />
                                  <asp:HiddenField runat="server" ID="hdnmobileno" />
                                <div class="card-body">

                                    <asp:Panel ID="pnl" runat="server" ScrollBars="Both" Height="500px">

                                        <asp:GridView ID="grd_dep_slip" runat="server" class="table" HeaderStyle-CssClass="k-header" GridLines="Both" HeaderStyle-BackColor="#d9880f" BorderColor="#d9880f"
                                            ShowHeaderWhenEmpty="true" HeaderStyle-ForeColor="White" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="grd_dep_slip_PageIndexChanging">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Approve">
                                                    <ItemTemplate>
                                                        <asp:Button ID="GvBtnApprove" Text="Approve" OnClick="GvBtnApprove_Click" class="btn btn-primary btn-block btn-flat" Style="background-color: chocolate;border-color: chocolate; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reject">
                                                    <ItemTemplate>
                                                       
                                                        <asp:Button ID="GvBtnReject" Text="Reject" OnClick="GvBtnReject_Click" class="btn btn-primary btn-block btn-flat" Style="background-color: brown;border-color:brown; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="Image">
                                          <ItemTemplate>
                                            
                                              <a class="btn btn-primary" style="background-color:#d9880f;border-color:#d9880f" runat="server" id="BtnSlip" onclick='<%# String.Format("ViewImage(\"{0}\", \"{1}\");", Eval("Image"), Eval("AccountType")) %>'>View Image </a>
                                            
                                          </ItemTemplate>
                                      </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="AccountType" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccountType" runat="server" Text='<%# Eval("AccountType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile&nbsp;Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMobileNumber" runat="server" Text='<%# Eval("MobileNumber") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Company&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCompanyname" runat="server" Text='<%# Eval("Companyname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Account&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccountName" runat="server" Text='<%# Eval("AccountName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="State">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="City">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Sales&nbsp;User&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSalesUserName" runat="server" Text='<%# Eval("SalesUserName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="APT&nbsp;Transaction&nbsp;ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAPTTransactionID" runat="server" Text='<%# Eval("APTTransactionID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Bank&nbsp;Transaction&nbsp;ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBankTransactionID" runat="server" Text='<%# Eval("BankTransactionID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DepositedDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepositedDate" runat="server" Text='<%# Eval("DepositedDate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="DepositMode">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepositMode" runat="server" Text='<%# Eval("DepositMode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="DepositedBank">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepositedBank" runat="server" Text='<%# Eval("DepositedBank") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                              

                                                 <%-- <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Image" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                  <asp:TemplateField HeaderText="ApproveStatus">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApproveStatus" runat="server" Text='<%# Eval("ApproveStatus") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Comments">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="CreatedDate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="DepositSlipRefID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepositSlipRefID" runat="server" Text='<%# Eval("DepositSlipRefID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>


                                            <EmptyDataTemplate>
                                                ------------------Sorry, No Records Found !----------------------
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>

                                <asp:LinkButton ID="Linkbtn" runat="server"></asp:LinkButton>
                             <cc1:ModalPopupExtender runat="server" ID="MdlEx" PopupControlID="Pnl1" TargetControlID="Linkbtn" CancelControlID="Button2"
                                    BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="Pnl1" runat="server" CssClass="modalPopup" Height="310px" Width="450px" align="center" Style="display: none; border-radius: 10px;border-color:#d9880f">
                                    <table style="height: 250px; width: 400px;">
                                        <tr>
                                            <td>
                                                <h3 style="color:#d9880f">Deposit Slip</h3>
                                            </td>
                                            <td>&nbsp;
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="Button2" runat="server" class="btn-danger" Font-Bold="true" BackColor="#d9880f" BorderColor="#d9880f" Text="X" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <hr />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                 <asp:Label ID="lblApp_amt" Text="Mobile No:"  runat="server"></asp:Label>
                                            </td>
                                              <td >
                                               <asp:Label ID="lbl_App_Mobile_no" runat="server"></asp:Label>
                                            </td>
                                             </tr>
                                         <tr>
                                              <td>
                                              <asp:Label ID="lbl_App_amt" Text="Amount:" runat="server"></asp:Label>
                                            </td>
                                              <td >
                                            <asp:Label ID="lbl_App_Amount" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                              <td>
                                              <asp:Label ID="lblRemarks" Text="Remarks :" runat="server" Visible="false"></asp:Label>
                                            </td>
                                              <td >
                                            <asp:TextBox ID="txtremarks" runat="server" Visible="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td colspan="3">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                            <td colspan="2">
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btnOk" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" OnClick="btnOk_Click" Text="Ok" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnCancel" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" OnClick="btnCancel_Click" Text="Cancel" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div>
        </div>
    </form>
    <uc3:Footer ID="Footer1" runat="server" />

    <script src="../../plugins/jquery/jquery.min.js"></script>

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap4 Duallistbox -->
    <script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
    <!-- InputMask -->
    <%--<script src="../../plugins/moment/moment.min.js"></script>--%>
    <script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>

    <!-- bootstrap color picker -->
    <script src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Bootstrap Switch -->
    <script src="../../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <!-- BS-Stepper -->
    <script src="../../plugins/bs-stepper/js/bs-stepper.min.js"></script>
    <!-- dropzonejs -->
    <script src="../../plugins/dropzone/min/dropzone.min.js"></script>

    <!-- datepicker -->

    <script src="../../js/jquery-ui.min.js"></script>
    <%--<script src="../../js/fastclick.min.js"></script>--%>
    <script src="../../js/bootstrap.min.js"></script>
    <%--<script src="../../js/jquery-asRange.min.js"></script>--%>
    <script src="../../js/jquery.timepicker.js"></script>
    <script src="../../js/jquery-customselect-1.9.1.min.js"></script>
    <script src="../../js/owl.carousel.min.js"></script>
    <script src="../../js/jquery.flexslider-min.js"></script>
    <script src="../../js/app.js"></script>

     <script type="text/javascript">

         function ViewImage(Image, AccTypeRefID) {
             var URL = "";
             if (Image.startsWith("UploadFiles/")) {
                 URL = Image;
             }
             else {
                 if (Image.startsWith("http:") || Image.startsWith("https:")) {
                     URL = Image;
                 }
                 else if (AccTypeRefID == "2") {
                     debugger;
                     //URL = "https://files.paynearby.in/UploadFiles/DistFiles/DepositSlip/" + Image;
                     URL = "https://localhost:44319/Document/Distfiles/Deposit_Slip/" + Image;
                 }
                 else if (AccTypeRefID == "3") {
                     //URL = "https://files.paynearby.in/UploadFiles/RetailerFiles/DepositSlip/" + Image;
                     URL += "/UploadFiles/RetailerFiles/DepositSlip/" + Image;
                 }
                 else if (AccTypeRefID == "10") {
                     //URL = "https://files.paynearby.in/UploadFiles/SDFiles/DepositSlip/" + Image;
                     URL += "/UploadFiles/SDFiles/DepositSlip/" + Image;
                 }
                 URL = Image;
                 window.open(URL, '_blank', 'height=800,width=1000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,titlebar=no');
             }
             
         }
     </script>

    <!-- AdminLTE for demo purposes -->
    <%--<script src="../../dist/js/demo.js"></script>--%>
    <script>
        $(function () {
            $("#example1").DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
    <script>$(window).load(function () { $('#page-loading').hide(); });</script>
</body>
</html>
