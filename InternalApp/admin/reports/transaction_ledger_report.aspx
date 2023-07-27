<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transaction_ledger_report.aspx.cs" Inherits="InternalApp.admin.reports.transaction_ledger_report" %>

<%@ Register src="../../Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="../../Admin_LM.ascx" tagname="Left_Menu" tagprefix="uc2" %>
<%@ Register src="../../Footer.ascx" tagname="Footer" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Transaction Report</title>
   <link rel = "icon" href = "../../dist/img/Accupay.png" type = "image/x-icon"/>

  <!-- Google Font: Source Sans Pro -->
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

  <!-- summernote -->
  <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css"/>
   
  
 
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>
 
    <!--Datepicker-->
    <%--<link href="../../css/bootstrap.min.css" rel="stylesheet"/>--%>
    <link href="../../css/jquery-customselect-1.9.1.css" rel="stylesheet"/>
    <link href="../../css/jquery-ui.min.css" rel="stylesheet" />
   <%-- <link href="../../css/asRange.min.css" rel="stylesheet" />--%>
    <link href="../../css/jquery.timepicker.css" rel="stylesheet" />
    <link href="../../css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../../css/flexslider.css" rel="stylesheet"/>
  <%--  <link href="../../css/style-changed.css" rel="stylesheet" />--%>

   
 
 
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>
  
  
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css"/>
  <!-- BS Stepper -->
  <link rel="stylesheet" href="../../plugins/bs-stepper/css/bs-stepper.min.css"/>
  <!-- dropzonejs -->
  <link rel="stylesheet" href="../../plugins/dropzone/min/dropzone.min.css"/>
 
    
<script type="text/javascript">
    function DisableBackButton() { window.history.forward(); }
    setTimeout("DisableBackButton()", 0);
    window.onunload = function () { null };
</script> 
    <script type = "text/javascript" >
        history.pushState(null, null, 'rklmhfgdw34fdcgtqryun');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'rklmhfgdw34fdcgtqryun');
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
   <%-- <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>DataTables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">DataTables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>--%>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h1 class="card-title" style="color:#d9880f;font-size:x-large">Account Statement</h1>
                  </div>
              <div class="card-header">
               <div class="form-group">     
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
                 <div class="row">

                     <div  class="col-lg-2">
 <div class="form-group">
                                            <asp:HiddenField ID="hdnfromDate" runat="server" />
                                            <label>From Date </label>
                                            <div class="datePicSec">
                                                <asp:TextBox type="text" runat="server" ID="FDate" placeholder="dd/mm/yyyy" class="form-control"></asp:TextBox>
                                                <span>
                                                    <img src="img/calander/datepicIcon.png" alt=""/></span>
                                                <asp:RequiredFieldValidator runat="server" ValidationGroup="rqvInput" ID="RequiredFieldValidator1" ControlToValidate="FDate" ErrorMessage="Please Select From Date!" />
                                            </div>
                                            <%--<span class="error-msg">This field is required</span>--%>
                                        </div>
                          </div>
                     <div  class="col-lg-2">
                <div class="form-group">
                                            <asp:HiddenField ID="hdntoDate" runat="server" />
                                            <label>To Date </label>
                                            <div class="datePicSec">
                                                <asp:TextBox type="text" class="form-control" runat="server" ID="ToDate" placeholder="dd/mm/yyyy"> </asp:TextBox>
                                                <span>
                                                    <img src="img/calander/datepicIcon.png" alt=""/></span>
                                                <asp:RequiredFieldValidator runat="server" ValidationGroup="rqvInput" ID="RequiredFieldValidator2" ControlToValidate="ToDate" ErrorMessage="Please Select To Date!" />
                                            </div>
                                            <%--<span class="error-msg">This field is required</span>--%>
                                        </div>
                     </div>
                  <div  class="col-lg-2">
                        <div class="form-group">
                             <label>Search Option *</label>

                                                                <asp:DropDownList runat="server" ID="DDL_Search" class="form-control">                                                                   
                                                                    <asp:ListItem Value="2" Text="Distributor"></asp:ListItem>
                                                                    <asp:ListItem Value="3" Text="Retailer"></asp:ListItem>
                                                                   
                                                                </asp:DropDownList>

                                                            </div>
                          </div>
                      <div  class="col-lg-3">
                     <div class="form-group">
                
                       <label>Search Value *</label>
                 
                      <asp:TextBox AutoCompleteType="Disabled"  runat="server"  class="form-control" ID="txt_searchvalue" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" MaxLength="10" placeholder="Mobile No." /> 
                            
                  </div>
                          </div>
                     <div  class="col-lg-1">
                      <div class="form-group">
                         
                           <br />
                         
                          <div>
                              <asp:Button runat="server" ID="btn_submit"  class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f;margin-top: 8px;" Text="Submit" OnClick="btn_submit_Click"></asp:Button>
               
                              
                              </div>
                </div>
                         </div>

                      <div  class="col-lg-1">
                      <div class="form-group">
                         
                           <br />
                         
                          <div>
                              <asp:Button runat="server" ID="btn_excel"  class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f;margin-top: 8px;" Text="Download" OnClick="btn_excel_Click"></asp:Button>
                  
                              
                              </div>
                </div>
                         </div>
               </div>
                   </div>
                   </div>
              <!-- /.card-header -->
                 
              <div class="card-body">
                   
                   <asp:Panel ID="pnl" runat="server" ScrollBars="Both" Height="500px">

                                            <asp:GridView ID="grd_transaction_report" runat="server" class="table" HeaderStyle-CssClass="k-header" GridLines="Both" HeaderStyle-BackColor="#d9880f" BorderColor="#d9880f"
                                                ShowHeaderWhenEmpty="true" HeaderStyle-ForeColor="White" AutoGenerateColumns="true" AllowPaging="true"  OnPageIndexChanging="OnPageIndexChanging" PageSize="10">                                                
                                              
                                                    <EmptyDataTemplate>
                                                                     ------------------Sorry, No Records Found !----------------------
                                                   <%-- ------------------No Record Found----------------------%>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </asp:Panel>
              <%--  <table id="example2" class="table table-bordered table-hover">
                  <thead style="background-color:#d9880f;color:white">
                  <tr>
                    <th>Rendering engine</th>
                    <th>Browser</th>
                    <th>Platform(s)</th>
                    <th>Engine version</th>
                    <th>CSS grade</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>Trident</td>
                    <td>Internet
                      Explorer 4.0
                    </td>
                    <td>Win 95+</td>
                    <td> 4</td>
                    <td>X</td>
                  </tr>
                 
                  <tr>
                    <td>Other browsers</td>
                    <td>All others</td>
                    <td>-</td>
                    <td>-</td>
                    <td>U</td>
                  </tr>
                  </tbody>
                  <tfoot style="background-color:#d9880f;color:white">
                  <tr>
                    <th>Rendering engine</th>
                    <th>Browser</th>
                    <th>Platform(s)</th>
                    <th>Engine version</th>
                    <th>CSS grade</th>
                  </tr>
                  </tfoot>
                </table>--%>
              </div>
              <!-- /.card-body -->
            
                   </div>
            <!-- /.card -->

       
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
             </div>
           
        <!-- /.row -->
    <%--  </div>--%>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

        <div>
        </div>
    </form>
  <uc3:Footer ID="Footer1" runat="server" />

  <script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->


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
   <%-- <script src="../../js/fastclick.min.js"></script>--%>
    <script src="../../js/bootstrap.min.js"></script>
   <%-- <script src="../../js/jquery-asRange.min.js"></script>--%>
    <script src="../../js/jquery.timepicker.js"></script>
    <script src="../../js/jquery-customselect-1.9.1.min.js"></script>
    <script src="../../js/owl.carousel.min.js"></script>
    <script src="../../js/jquery.flexslider-min.js"></script>
    <script src="../../js/app.js"></script>

  

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
  
    <%--<script type="text/javascript">
        $("#FDate").attr('readonly', 'readonly');
        $("#ToDate").attr('readonly', 'readonly');
    </script>--%>

        <script>$(window).load(function () { $('#page-loading').hide(); });</script>
</body>
</html>