<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayeeApproval.aspx.cs" Inherits="InternalApp.admin.reports.PayeeApproval" %>


<%@ Register Src="../../Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="../../Admin_LM.ascx" TagName="Left_Menu" TagPrefix="uc2" %>
<%@ Register Src="../../Footer.ascx" TagName="Footer" TagPrefix="uc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agent Approval</title>

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
    <link href="../../css/asRange.min.css" rel="stylesheet" />
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
        var submit = 0;
        function CheckDouble() {
            if (++submit > 1) {
              //  alert('This sometimes takes a few seconds - please be patient.');
                return false;
            }
        }
    </script>
</head>
<body>
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
                                    <h1 class="card-title" style="color: #d9880f; font-size: x-large">Agent Approval</h1>
                                </div>
                                <div class="card-header">
                                    <div class="form-group">
                                        <div class="row">
                                              <div class="col-lg-3">
                                                <div class="form-group">
                                                    <asp:HiddenField ID="hdnfromDate" runat="server" />
                                                    <label>From Date </label>
                                                    <div class="datePicSec">
                                                        <asp:TextBox type="text" runat="server" ID="FDate" placeholder="dd/mm/yyyy" class="form-control"></asp:TextBox>
                                                        <span>
                                                            <img src="img/calander/datepicIcon.png" alt="" /></span>
                                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="rqvInput" ID="RequiredFieldValidator1" ControlToValidate="FDate" ErrorMessage="Please Select From Date!" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <asp:HiddenField ID="hdntoDate" runat="server" />
                                                    <label>To Date </label>
                                                    <div class="datePicSec">
                                                        <asp:TextBox type="text" class="form-control" runat="server" ID="ToDate" placeholder="dd/mm/yyyy"> </asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="rqvInput" ID="RequiredFieldValidator2" ControlToValidate="ToDate" ErrorMessage="Please Select To Date!" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label>Agent Mobile Number</label>
                                                    <asp:TextBox AutoCompleteType="Disabled" runat="server" class="form-control" ID="txtAgentMobileNo" placeholder="Mobile number" />

                                                </div>
                                            </div>
                                            <div class="col-lg-1">
                                                <div class="form-group">
                                                    <br />
                                                    <div>
                                                        <asp:Button runat="server" ID="btn_submit" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px;" Text="Submit" OnClick="btn_submit_Click"></asp:Button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-1">
                                                <div class="form-group">

                                                    <br />

                                                    <div>
                                                        <asp:Button runat="server" ID="btn_excel" Visible="false" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px;" Text="Download" OnClick="btn_excel_Click"></asp:Button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:HiddenField runat="server" ID="hdnAgentID" />
                                <asp:HiddenField runat="server" ID="hdnStatusValue" />
                                 <asp:HiddenField runat="server" ID="hdnBtnValue" />
                                 <asp:HiddenField runat="server" ID="hdnBankName" />
                                 <asp:HiddenField runat="server" ID="hdnIfscCode" />
                                <div class="card-body">

                                    <asp:Panel ID="pnl" runat="server" ScrollBars="Both" Height="500px">

                                        <asp:GridView ID="grd_AgentApproval_report" runat="server" class="table" HeaderStyle-CssClass="k-header" GridLines="Both" HeaderStyle-BackColor="#d9880f" BorderColor="#d9880f"
                                            ShowHeaderWhenEmpty="true" HeaderStyle-ForeColor="White" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="grd_AgentApproval_report_PageIndexChanging" PageSize="10">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Bene&nbsp;Validation">
                                                    <ItemTemplate>
                                                        <asp:Button ID="GvBtnCheck" OnClick="GvBtnCheck_Click" Text="Bene Validation" class="btn btn-primary btn-block btn-flat" Style="background-color: #d9880f; border-color: #d9880f; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Approve&nbsp;/&nbsp;Reject">
                                                    <ItemTemplate>
                                                        <asp:Button ID="GvBtnApprove" Text="Approve" OnClick="GvBtnApprove_Click" class="btn btn-primary btn-block btn-flat" Style="background-color: #33af40; border-color: #33af40; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" />
                                                        <asp:Button ID="GvBtnReject" Text="Reject" OnClick="GvBtnReject_Click" class="btn btn-primary btn-block btn-flat" Style="background-color: #42a5cc; border-color: #42a5cc; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <a class="btn btn-primary" style="background-color: #d9880f; border-color: #d9880f" runat="server" id="BtnSlip" onclick='<%# String.Format("ViewImage(\"{0}\");", Eval("BankCopyfile")) %>'>View Image </a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="AgentPayeeRefID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblAgentPayeeRefID" runat="server" Text='<%# Eval("AgentPayeeRefID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Agent&nbsp;Mobile&nbsp;Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblAgentMobileNo" runat="server" Text='<%# Eval("AgentMobileNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Agent&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblAgentName" runat="server" Text='<%# Eval("AgentName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Agency&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblAgencyName" runat="server" Text='<%# Eval("AgencyName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bank&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblBankName" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bank&nbsp;Account&nbsp;Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblBankAccountNumber" runat="server" Text='<%# Eval("BankAccountNumber") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account&nbsp;Holder&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblAccountHolderName" runat="server" Text='<%# Eval("AccountHolderName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IFSC&nbsp;Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblIFSCCode" runat="server" Text='<%# Eval("IFSCCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account&nbsp;Validation&nbsp;Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblAccountValidationStatus" runat="server" Text='<%# Eval("AccountValidationStatus") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NPCI&nbsp;Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblNPCIName" runat="server" Text='<%# Eval("NPCIName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name&nbsp;Match&nbsp;Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblNameMatchStatus" runat="server" Text='<%# Eval("NameMatchStatus") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Approve&nbsp;Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GvLblApproveStatus" runat="server" Text='<%# Eval("ApproveStatus") %>'></asp:Label>
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
                                <asp:Panel ID="Pnl1" runat="server" CssClass="modalPopup" Height="270px" Width="450px" align="center" Style="display: none; border-radius: 10px;">
                                    <table style="height: 250px; width: 400px;">
                                        <tr>
                                            <td>
                                                <h3>Alert</h3>
                                            </td>
                                            <td>&nbsp;
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="Button2" runat="server" class="btn-danger" Font-Bold="true" Text="X" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <hr />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <asp:Label ID="lblMblNo" runat="server" Text="Mobile Number :"></asp:Label>
                                            </td>
                                              <td colspan="2">
                                                <asp:Label ID="lblMblNo1" runat="server"></asp:Label>
                                            </td>
                                             </tr>
                                         <tr>
                                              <td>
                                                <asp:Label ID="lblAccNo" runat="server" Text="Account Number :"></asp:Label>
                                            </td>
                                              <td colspan="2">
                                                <asp:Label ID="lblAccNo1" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
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
                                                            <asp:Button ID="btnOk" class="btn btn-primary btn-block btn-flat" Style="background-color: #33af40; border-color: #33af40; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" OnClick="btnOk_Click" OnClientClick="return CheckDouble();" Text="Ok" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnCancel" class="btn btn-primary btn-block btn-flat" Style="background-color: #42a5cc; border-color: #42a5cc; margin-top: 8px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px;" runat="server" OnClick="btnCancel_Click" Text="Cancel" /></td>
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
    <script src="../../js/fastclick.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery-asRange.min.js"></script>
    <script src="../../js/jquery.timepicker.js"></script>
    <script src="../../js/jquery-customselect-1.9.1.min.js"></script>
    <script src="../../js/owl.carousel.min.js"></script>
    <script src="../../js/jquery.flexslider-min.js"></script>
    <script src="../../js/app.js"></script>

      <script type="text/javascript">

          function ViewImage(Image) {
              URL = Image;
              window.open(URL, '_blank', 'height=800,width=1000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,titlebar=no');
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
     <script type="text/javascript">
         $('#<%= FDate.ClientID %>').attr('readonly', true);
         $('#<%= ToDate.ClientID %>').attr('readonly', true);
         $(function () {
             var dateFormat = "dd-M-yy";
             $('#<%= FDate.ClientID %>').datepicker({
                numberOfMonths: 1,
                changeMonth: true,
                changeYear: true,
                maxDate: 0,
                dateFormat: 'dd-M-yy',
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    var dts = new Date();
                    if (dt.toDateString("dd-M-yy") == dts.toDateString("dd-M-yy")) {
                        $('#<%= ToDate.ClientID %>').datepicker("option", "minDate", dt);
                        $('#<%= ToDate.ClientID %>').datepicker("option", "maxDate", dt);
                    }
                    else {
                        dts.setDate(dts.getDate() - 1);
                        $('#<%= ToDate.ClientID %>').datepicker("option", "maxDate", dts);
                        $('#<%= ToDate.ClientID %>').datepicker("option", "minDate", dt);
                    }
                    $('#<%= hdnfromDate.ClientID %>').val($('#<%= FDate.ClientID %>').val());
                    $('#<%= hdntoDate.ClientID %>').val($('#<%= ToDate.ClientID %>').val());
                }
            }).datepicker('setDate', 'today');
            $('#<%= ToDate.ClientID %>').datepicker({
                numberOfMonths: 1,
                changeMonth: true,
                changeYear: true,
                maxDate: 0,
                dateFormat: 'dd-M-yy',
                onSelect: function (selected) {
                    $('#<%= hdntoDate.ClientID %>').val($('#<%= ToDate.ClientID %>').val());
                }
            });

            if ($('#<%= hdnfromDate.ClientID %>').val() == null || $('#<%= hdnfromDate.ClientID %>').val() == "") {
                $('#<%= FDate.ClientID %>').datepicker('setDate', 'today')
                $('#<%= hdnfromDate.ClientID %>').val($('#<%= FDate.ClientID %>').val());
            }
            else
                $('#<%= FDate.ClientID %>').val($('#<%= hdnfromDate.ClientID %>').val());

            if ($('#<%= hdntoDate.ClientID %>').val() == null || $('#<%= hdntoDate.ClientID %>').val() == "") {
                $('#<%= ToDate.ClientID %>').datepicker('setDate', 'today')
                $('#<%= ToDate.ClientID %>').datepicker("option", "minDate", $('#<%= FDate.ClientID %>').val());
                $('#<%= hdntoDate.ClientID %>').val($('#<%= ToDate.ClientID %>').val());
            }
            else {
                $('#<%= ToDate.ClientID %>').val($('#<%= hdntoDate.ClientID %>').val());
                var dt = new Date($('#<%= FDate.ClientID %>').val());
                var dts = new Date();
                if (dt.toDateString("dd-M-yy") == dts.toDateString("dd-M-yy")) {
                    $('#<%= ToDate.ClientID %>').datepicker("option", "minDate", dt);
                    $('#<%= ToDate.ClientID %>').datepicker("option", "maxDate", dt);
                }
                else {
                    dts.setDate(dts.getDate() - 1);
                    $('#<%= ToDate.ClientID %>').datepicker("option", "maxDate", dts);
                    $('#<%= ToDate.ClientID %>').datepicker("option", "minDate", dt);
                }
                return;
            }
        });
     </script>
    <script>$(window).load(function () { $('#page-loading').hide(); });</script>
</body>
</html>

