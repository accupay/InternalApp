<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transaction_Report.aspx.cs" Inherits="InternalApp.admin.Reports.transaction_Report" %>

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
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css"/>
  <!-- summernote -->
  <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css"/>
    <!-- Date Picker -->
    <link href="../../plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
  
 
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>
 



   
 
  <!-- daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css"/>
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>
  
  <!-- Select2 -->
  <link rel="stylesheet" href="../../plugins/select2/css/select2.min.css"/>
  <link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css"/>
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css"/>
  <!-- BS Stepper -->
  <link rel="stylesheet" href="../../plugins/bs-stepper/css/bs-stepper.min.css"/>
  <!-- dropzonejs -->
  <link rel="stylesheet" href="../../plugins/dropzone/min/dropzone.min.css"/>
 
     <script type="text/C#" runat="server">
        string dc = DateTime.Now.ToString("dd-MMM-yyyy");
        protected void textbox1_TextChanged(object sender, EventArgs e)
        {
             if(FDate.Text == "")
             {
                  FDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
             }
             if(ToDate.Text == "")
             {
                  ToDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
             }
            DateTime dt2 = Convert.ToDateTime(ToDate.Text);
            DateTime dt1 = Convert.ToDateTime(FDate.Text);
            DateTime d1 = Convert.ToDateTime(dc);
            try
            {
                if (dt1 > d1)
                {
                    FDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                    return;
                }
                else if (dt1 > dt2)
                {
                    FDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                    return;
                }
            }
            catch (Exception ex)
            {
               
            }
        }
        protected void textbox2_TextChanged(object sender, EventArgs e)
        {
             if(FDate.Text == "")
             {
                  FDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
             }
             if(ToDate.Text == "")
             {
                  ToDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
             }
            DateTime dt1 = Convert.ToDateTime(FDate.Text);
            DateTime dt2 = Convert.ToDateTime(ToDate.Text);
            DateTime d1 = Convert.ToDateTime(dc);
            try
            {
                if (dt2 < dt1)
                {
                    ToDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                    return;
                }
                else if (dt2 > d1)
                {
                    ToDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                    return;
                }
            }
            catch (Exception ex)
            {
            
            }
        }

    </script>
<script type="text/javascript">
    function DisableBackButton() { window.history.forward(); }
    setTimeout("DisableBackButton()", 0);
    window.onunload = function () { null };
</script> 
    <script type = "text/javascript" >
        history.pushState(null, null, 'nbgdfe4cvbgqq38bvfz');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'nbgdfe4cvbgqq38bvfz');
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
                <h1 class="card-title" style="color:#d9880f;font-size:x-large">Transaction Report</h1>
                  </div>
              <div class="card-header">
               <div class="form-group">             
                 <div class="row">

                     <div  class="col-lg-2">
<div class="form-group">

                  <label>From Date</label>
                    <div class="input-group date"  id="reservationdate1" data-target-input="nearest">
                      <asp:TextBox ID="FDate" runat="server" class="form-control datetimepicker-input"  OnTextChanged="textbox1_TextChanged" data-inputmask="datemask" ></asp:TextBox>
                       <%-- <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate"/>--%>
                        <div class="input-group-append" data-target="#reservationdate1" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
                          </div>
                     <div  class="col-lg-2">
                <div class="form-group">
                  <label>To Date</label>
                    
                    <div class="input-group date"  id="reservationdate2" data-target-input="nearest">
                      <asp:TextBox ID="ToDate" runat="server" class="form-control datetimepicker-input" data-inputmask="'alias': ''" data-mask></asp:TextBox>
                       <%-- <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate"/>--%>
                        <div class="input-group-append" data-target="#reservationdate2" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                       
                   
                     </div>
                     </div>
                      <div  class="col-lg-2">
                        <div class="form-group">
                             <label>Search Option</label>

                                                                <asp:DropDownList runat="server" ID="DDL_Search" class="form-control">
                                                                    <asp:ListItem Value="0" Text="All"></asp:ListItem>
                                                                    <asp:ListItem Value="1" Text="TransactionID"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="MobileNo"></asp:ListItem>
                                                                    <asp:ListItem Value="3" Text="UTRNO"></asp:ListItem>
                                                                   
                                                                </asp:DropDownList>

                                                            </div>
                          </div>
                      <div  class="col-lg-3">
                     <div class="form-group">
                  <%--  <label for="exampleInputPassword1">Old Password</label>--%>
                       <label>Search Value</label>
                  <%--  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Old Password">--%>
                      <asp:TextBox AutoCompleteType="Disabled"  runat="server"  class="form-control" ID="txt_searchvalue" placeholder="Search Value" /> 
                            
                  </div>
                          </div>
                     <div  class="col-lg-1">
                      <div class="form-group">
                         
                           <br />
                         
                          <div>
                              <asp:Button runat="server" ID="btn_submit"  class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f;margin-top: 8px;" Text="Submit" OnClick="btn_submit_Click"></asp:Button>
                  <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                              
                              </div>
                </div>
                         </div>

                      <div  class="col-lg-1">
                      <div class="form-group">
                         
                           <br />
                         
                          <div>
                              <asp:Button runat="server" ID="btn_excel"  class="btn btn-primary btn-block btn-flat" style="background-color:#d9880f;border-color:#d9880f;margin-top: 8px;" Text="Download" OnClick="btn_excel_Click"></asp:Button>
                  <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                              
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
                                                ShowHeaderWhenEmpty="true" HeaderStyle-ForeColor="White" AutoGenerateColumns="true">                                                
                                              
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
<!-- Select2 -->
<script src="../../plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<%--<script src="../../plugins/moment/moment.min.js"></script>--%>
<script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
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

<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
    <!-- date-range-picker -->
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
     <!-- bootstrap datepicker -->
            <script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- AdminLTE App -->

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
    <script>
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
            //Money Euro
            $('[data-mask]').inputmask()

            //Date picker
            $('#reservationdate1').datetimepicker({
                format: 'L'
            });
            $('#reservationdate2').datetimepicker({
                format: 'L'
            });
          
            //Date and time picker
            $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });

            //Date range picker
            $('#reservation').daterangepicker()
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 30,
                locale: {
                    format: 'MM/DD/YYYY hh:mm A'
                }
            })
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
                }
            )

            //Date picker
            $('#FDate').datepicker({
                autoclose: true,
                format: "dd-M-yyyy",
                endDate: 'd'

            });

            //Date picker
            $('#ToDate').datepicker({
                autoclose: true,
                format: "dd-M-yyyy",
                endDate: 'd'

            });

            //Timepicker
            $('#timepicker').datetimepicker({
                format: 'LT'
            })

            //Bootstrap Duallistbox
            $('.duallistbox').bootstrapDualListbox()

            //Colorpicker
            $('.my-colorpicker1').colorpicker()
            //color picker with addon
            $('.my-colorpicker2').colorpicker()

            $('.my-colorpicker2').on('colorpickerChange', function (event) {
                $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
            })

            $("input[data-bootstrap-switch]").each(function () {
                $(this).bootstrapSwitch('state', $(this).prop('checked'));
            })

        })
       
  // DropzoneJS Demo Code End
    </script>
    <%--<script type="text/javascript">
        $("#FDate").attr('readonly', 'readonly');
        $("#ToDate").attr('readonly', 'readonly');
    </script>--%>

        <script>$(window).load(function () { $('#page-loading').hide(); });</script>
</body>
</html>
