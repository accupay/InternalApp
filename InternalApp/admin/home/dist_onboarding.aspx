<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dist_onboarding.aspx.cs" Inherits="InternalApp.admin.home.dist_onboarding" %>

<%@ Register src="../../Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="../../Admin_LM.ascx" tagname="Left_Menu" tagprefix="uc2" %>
<%@ Register src="../../Footer.ascx" tagname="Footer" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Dist Onboarding</title>
   <link rel = "icon" href = "../../dist/img/Accupay.png" type = "image/x-icon"/>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css"/>
  <!-- daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css"/>
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>
  <!-- Select2 -->
  <link rel="stylesheet" href="../../plugins/select2/css/select2.min.css"/>
  <link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css"/>
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css"/>
  <!-- BS Stepper -->
  <link rel="stylesheet" href="../../plugins/bs-stepper/css/bs-stepper.min.css"/>
  <!-- dropzonejs -->
  <link rel="stylesheet" href="../../plugins/dropzone/min/dropzone.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css"/>
<script type="text/javascript">
    function DisableBackButton() { window.history.forward(); }
    setTimeout("DisableBackButton()", 0);
    window.onunload = function () { null };
</script> 
    <script type = "text/javascript" >
        history.pushState(null, null, 'bvhjggh5g435gfgh53');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'bvhjggh5g435gfgh53');
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
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Distributor OnBoarding</h1>
          </div>
         
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        
        <!-- /.card -->

        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
           <%-- <h3 class="card-title">Select2 (Bootstrap4 Theme)</h3>--%>

            <%--<div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>--%>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Minimal</label>
                  <select class="form-control select2bs4" style="width: 100%;">
                    <option selected="selected">Alabama</option>
                    <option>Alaska</option>
                    <option>California</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>Disabled</label>
                  <select class="form-control select2bs4" disabled="disabled" style="width: 100%;">
                    <option selected="selected">Alabama</option>
                    <option>Alaska</option>
                    <option>California</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Multiple</label>
                  <select class="select2bs4" multiple="multiple" data-placeholder="Select a State"
                          style="width: 100%;">
                    <option>Alabama</option>
                    <option>Alaska</option>
                    <option>California</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>Disabled Result</label>
                  <select class="form-control select2bs4" style="width: 100%;">
                    <option selected="selected">Alabama</option>
                    <option>Alaska</option>
                    <option disabled="disabled">California (disabled)</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <%--<div class="card-footer">
            Visit <a href="https://select2.github.io/">Select2 documentation</a> for more examples and information about
            the plugin.
          </div>--%>
        </div>
        <!-- /.card -->

     

       
    
     
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  

        <div>
        </div>
    </form>
  <uc3:Footer ID="Footer1" runat="server" />

 <!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="../../plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/moment/moment.min.js"></script>
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

<%--<script src="../../dist/js/demo.js"></script>--%>
<!-- Page specific script -->
  
</body>
</html>
