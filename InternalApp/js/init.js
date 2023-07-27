$('.currency-symbol-input').prepend('<i class="icon-rupee-medium"></i>');
$('.countrycode-input').prepend('<span class="country-prefix">+91</span>');

$(document).ready(function () {
  $(function () { $('[data-toggle="tooltip"]').tooltip() });

  $(".numeric").numeric();

  $(".selInput").kendoDropDownList({
    //optionLabel: "-- Select --",
    //filter: "startswith",
  });

  //$('.k-list-filter>.k-textbox').attr('placeholder', 'Start searching...')
  $('.k-list-filter>.k-textbox').attr('type', 'text');

  $('.mobileCheck').keyup(function () {
    if ($(this).val() == '') {
      $(this).next('i').addClass('hide');
    } else {
      $(this).next('i').removeClass('hide');
    }
  });

  $(document).on('blur', 'input.mobileCheck', function () {
    var cMobileNumber = $(this).closest('.mobileCheck').val();
    $(this).closest('.defaultFields').addClass('hide');
    $(this).closest('.form-group').find('.balanceCheckContainer').removeClass('hide');
    $(this).closest('div').find('.bc-mobilenumber').text(cMobileNumber);
  });

  $('.form-group').on('click', '.edit-number', function () {
    $(this).closest('.balanceCheckContainer').addClass('hide');
    $(this).closest('.form-group').find('.defaultFields').removeClass('hide');
  });

  $('.tab-buttons').on('click', 'li a', function () {
    $(this).closest('ul').find('li.active').removeClass('active');
    $(this).parent('li').addClass('active');
  });

  $('.tab-buttons').on('click', '#senderPin', function () {
    $('.enterPinOtp').val('');
    $('#confirmText').text('Enter PIN');
    $('.enterPinOtp').attr('placeholder', 'Eg: 0000');
  });

  $('.tab-buttons').on('click', '#senderPin', function () {
    $('.enterPinOtp').val('');
    $('#confirmText').text('Enter PIN');
    $('.enterPinOtp').attr('placeholder', 'Eg: 0000');
  });

  $('.tab-buttons').on('click', '#senderOtp', function () {
    $('.tab-buttons li').removeClass('active');
    $(this).parent('li').addClass('active');
    $('.enterPinOtp').val('');
    $('#confirmText').text('Enter OTP');
    $('.enterPinOtp').attr('placeholder', 'Eg: 3726');
  });

  $('.btnAddNewPayee').on('click', function () {
    //$(this).toggleClass('active');
  });

  $('#btnBeneSend').on('click', function () {
    $(this).closest('#addNewPayeeContainer').find('.page-header').hide();
    $(this).closest('#addNewPayeeContainer').find('form').hide();
    $('.validate-transaction').removeClass('hide');
  });

  $('#btnTransComplete').on('click', function () {
    $('.content-overlay').hide();
    $('.validate-transaction, #addNewPayeeContainer').slideUp();
    $('.st-table-container .st-newrow').slideDown();
    setTimeout(function () {
      $('#alertPaySuccess').slideDown();
    }, 1000);
    setTimeout(function () {
      $('#st-newrow').slideDown();
    }, 2000);
  });

  $('#btnContinueTrans').on('click', function () {
    $('.validate-transaction').addClass('hide');
    $('.validate-otp').slideDown();
  });

  $('#btnTransComplete').on('click', function () {
    //$('.validate-otp').removeClass('hide');
  });

  $('#btnConfirmNewPay').on('click', function () {
    $('#addNewPayeeContainer').slideUp();
    setTimeout(function () {
      $('#st-newrow').slideDown();
    }, 1000);
  });

  $('#btnNewTicket').on('click', function () {
    $('#addNewTicketContainer').addClass('hide');
    $('#ticketOTP').slideDown();
  }); 

  $('#btnValidateTicket').on('click', function () {
    $('.ticket-newrow').slideDown();
    setTimeout(function () {
      $('#alertTicketSuccess').slideDown();
    }, 1000);
    setTimeout(function () {
      $('#ticket-newrow').slideDown();
      $('#ticket-newrow').addClass('highlight-newticket');
    }, 2000);
    setTimeout(function () {
      $('#alertTicketSuccess').slideUp();
    }, 3500);
    setTimeout(function () {
      $('#ticket-newrow').removeClass('highlight-newticket');
    }, 5000);
  });

  $(document).on('click', '.grid-row ul.tab-buttons li a', function () {
    $(this).closest('ul').find('li').removeClass('active');
    $(this).closest('li').addClass('active');
  });

  $(".payee-table .grid-row .grid-item").click(function () {
    /*$('.payee-table .grid-row').removeClass('selected clfcout payment-status');
    $(this).closest('.grid-row').addClass('selected');
    $(this).closest('.grid-row.selected').find('.gcd').addClass('hide');
    $(this).closest('.grid-row.selected').find('.gcn').removeClass('hide');
    $('.content-overlay').removeClass('hide');*/

    $('.grid-row .fg-amount .form-control').keyup(function () {
      if ($(this).val().length !== 0) {
        $(this).closest('.form-group').find('label').removeClass('hide');
      } else {
        $(this).closest('.form-group').find('label').addClass('hide');
      }
    });

    $('.grid-row .fg-comments .form-control').keyup(function () {
      if ($(this).val().length !== 0) {
        $(this).closest('.form-group').find('label').removeClass('hide');
        $(this).closest('.grid-row').find('.remittance-btn').removeClass('disabled');
        $(this).closest('.grid-row').find('.remittance-btn').attr('disabled', false);
      } else {
        $(this).closest('.form-group').find('label').addClass('hide');
        $(this).closest('.grid-row').find('.remittance-btn').addClass('disabled');
        $(this).closest('.grid-row').find('.remittance-btn').attr('disabled', true);
      }
    });

    $(document).on('click', '.remittance-btn', function () {
      $(this).closest('.grid-row').addClass('hide');
      $(this).closest('.modal').find('.modal-body').addClass('mb-status');
      $(this).closest('.mb-status').find('.alert').removeClass('hide');
      $(this).closest('.mb-status').find('.grid-row').addClass('payment-status');
    });
  });

  $(document).on('keyup', '#dashboardURL', function () {
    if ($(this).val()) {
      $('#redirectLink').attr('href', 'sender-registration.html');
    } else {
      $('#redirectLink').attr('href', 'sender-loggedin.html');
    }
  });

  $(document).on('click', '.fileupload', function () {
    var currentAnchor = $(this).closest('.file-upload-container').find('.fileupload-progress');
    var nextAnchor = $(this).closest('.file-upload-container').find('.fileupload-status');
    var successAnchor = $(this).closest('.file-upload-container').find('.fileupload-complete');
    $(this).closest('.file-upload-container').find('>a').hide();
    $(this).closest('.file-upload-container').find('.fileupload-progress').css('display', 'block');
    setTimeout(
      function () {
        $(currentAnchor).hide();
        $(nextAnchor).css('display', 'block');
      },
    2000);
    setTimeout(
      function () {
        $(nextAnchor).hide();
        $(successAnchor).css('display', 'block');
      },
    3000);
  });

  $(document).on('click', '#srUpdateKYC', function () {
    $(this).hide();
    $('#kycFormContainer').slideDown();
    $('.kyc-options').removeClass('hide');
    //$('.alert-kyc').hide();
    $('#btnRegistrationCancel').removeClass('kyc-button kyc-click-1').addClass('row');
  });

  $(document).on('click', '.kyc-update-cancel', function () {
    $('.kyc-options').addClass('hide');
    $('#srUpdateKYC').show();
    $('#kycFormContainer').slideUp();
    //$('.alert-kyc').show();
    $('#btnRegistrationCancel').removeClass('row').addClass('kyc-button kyc-click-1');
  });
});

// Form validations
$(document).ready(function () {
  $('form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
      valid: 'icon-payment-success-medium icon-sm',
      invalid: 'icon-payment-failure-medium icon-sm',
      validating: 'icon-balance-refresh-mini icon-sm'
    },
    fields: {
      sname: {
        message: 'Name is not valid',
        validators: {
          notEmpty: {
            message: 'Should not be empty'
          },
          stringLength: {
            min: 6,
            max: 30,
            message: 'Should not be less than 6 characters'
          },
          regexp: {
            regexp: /^[a-zA-Z0-9_\.]+$/,
            message: 'Only alphabetical, numbers, dot, underscore allowed'
          }
        }
      },

      mobileNumberCheck: {
        message: 'Mobile number is not valid',
        validators: {
          notEmpty: {
            message: 'Should not be empty'
          },
          stringLength: {
            min: 10,
            max: 10,
            message: 'Should be 10 digits'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Only numbers are allowed'
          }
        }
      },

      pinCheck: {
        message: 'PIN is not valid',
        validators: {
          notEmpty: {
            message: 'PIN should not be empty'
          },
          stringLength: {
            min: 6,
            max: 6,
            message: 'Should be 6 digits'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Only numbers are allowed'
          }
        }
      },
    }
  });
});

$(".datetimecalendar").kendoDateTimePicker({
  format: "dd-MMM-yyyy",
  parseFormats: ["MMMM yyyy", "HH:mm"],
  popup: {
    appendTo: $(this).closest(".form-group")
  },
});

$(document).ready(function () {
  $('input.datetimecalendar').addClass('form-control');
  $("#reportTable").kendoGrid({
    //height: 350,
    sortable: true,
    /*pageable:true,*/
    scrollable: true,
    pageable: {
      refresh: false,
      pageSizes: false,
      info: false,
    },
    dataSource: {
      pageSize: 6
    },
    resizable: true,
    dataBound: function () {
      $('td:first-child').each(function () {
        $(this).addClass('firstTd');
      })
    }
  });
  $("#rechargeTable").kendoGrid({
    sortable: true,
    scrollable: false,
    pageable: false,
    dataBound: function () {
      $('td:first-child').each(function () {
        $(this).addClass('firstTd');
      })
    }
  });

  
});