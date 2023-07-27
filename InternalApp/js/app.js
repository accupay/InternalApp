
$(window).load(function() {
	setTimeout(function () {
		 $('.pageLoader').css("display", "none");
	 }, 1500);
});


$(document).ready(function(){
    $(".sideBarMenu ul").after().click(function(){
        $(".sideBarMenu > ul > li > a.menuList > div:last-child").toggleClass("mobileShowHide")
        $(".sideBarMenu").toggleClass("sidebarOpenClose")
    })
    $(".sideBarMenu, .popupMenu, .dropdownMenu, .dwMenu").click(function(event){
        event.stopPropagation();
    })
    $("html, body").on("click", function(e){
        $(".sideBarMenu").removeClass("openMenu")
        $(".popupMenu").hide();
        $(".sideBarMenu > ul > li > a.menuList > div:last-child").removeClass("mobileShowHide")
        $(".sideBarMenu").removeClass("sidebarOpenClose")
        $(".dropdownMenu").hide();
    })
   $(".btn-login").on("click", function(){
       if($(".mobileIcon >   'input").val() === "admin" &&  $(".pwIcon > input").val() === "admin") {
           console.log("login...")
           location.href = "dashboard.html";
       }
       else {
        location.href = "dashboard.html";
       }
   })
   $(".modeOfRecharge > div:first-child > .btn-rounded").click(function(){
       $(this).addClass("btn-rounded-active").siblings().removeClass("btn-rounded-active");
   })
   $(".btnJustify > a").click(function(){
       $(this).addClass("btnJustifyActive").siblings().removeClass("btnJustifyActive");
   })
   $(".dwMenu").click(function(){
       $(".dropdownMenu").slideToggle(200);
   })

    $(".videoBx > div img").on("click", function(){
        $(".popUp").toggle();
        $("body").css("overflow-y", "hidden");
    });
    $(".closeIcon").click(function(){
        $(".popUp").fadeOut(500);
        $("body").css("overflow-y", "auto");
    })
    
    $(".amtField input").on("focus", function(){
        $(".checkIcon > span").hide();
    }).blur(function(){
        $(".checkIcon > span").show();
    })
    $(".browsePlan").hide();
    $(".checkIcon > span").on("click", function(){
        $(".loader").show();
        setTimeout(function(){
            $(".browsePlan").toggle();
            $(".rechargeBtn").toggle();
            $(".loader").hide();
            $(".checkIcon > span img").show();
        },1000);
        $(this).addClass("disable");
    })
    $(".closeIco, .closeICO").click(function(){
        $(".browsePlan").hide();
        $(".rechargeBtn").show();
        $(".checkIcon > span img").hide();
        $(".checkIcon > span").removeClass("disable")
    });
    $(".popupMenu").hide();
    $(".moreMenu > .menuList").on("click", function(){
        $(".popupMenu").toggle();
    })
    $(".rechargeCont > li .btn-default").on("click", function(){
        $(this).addClass("btnActive").parents().siblings().find(".btn").removeClass("btnActive");
        
        var amt    = $(this).html();
        var getNum = amt.match(/\d+/g, "")+'';
        var numAmt = getNum.split(',').join('');
        $("#amtVal").val(Number(numAmt));
    });
	
	//Read More
	$(".founderMsgReadmore").click(function(e){
		e.preventDefault();
		$(this).fadeOut(100);
		$(".founderMsgPara").fadeIn(200);
	})
	
	$('.navbar-toggle').click(function(){
		$('.navbar-collapse').toggleClass('open');
	})
	
	//Seat Selection
	$(".passenger li span").click(function(){
		$(this).parent().toggleClass("selectedSeat");
	})
	
	//Bank Finance Dropdown
	$(".accountDetailBlk h5").click(function(){
		$(this).parent().parent().siblings().find('.accountDetailBlk').removeClass("open");
		$(this).parent().toggleClass("open");
	})
	
	//Mobile mrnu open body Fixed
	$(".navbar-toggle").click(function(){
		$(".dashboardContainer").toggleClass("fixed");
	})
	
	//File Upload 
	 $(".sjb-attachment").change(function() {		
		var val = $(this).val();		
		var newval =  val.replace(/\\/g,'/').replace( /.*\//, '' ); 
		$(this).siblings("span").html(newval);
	});
    try {	
	//Date Picker
	$( '.date-picker' ).datepicker({dateFormat: 'dd-mm-yy'});
	$('input.timepicker').timepicker({ timeFormat: 'HH:00' });
    }
    catch (e) {

    }
	//Sleeper Seats
	$('.upperSeats').hide();
	$('.semi-lower').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		$('.lowerSeats').show();
		$('.upperSeats').hide();
	});
	
	$('.semi-upper').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		$('.upperSeats').show();
		$('.lowerSeats').hide();
	});
    try {
	//Price Range
	$(".range-example-input-2").asRange({
		range: true,
		limit: false,
		step: 1,
	});
    }
    catch (e) {

    }
	//Detart Time
	$('.depTimeSelect li').click(function(){
		$(this).toggleClass('select');
	});
	
	//Sort list 
	$('.sortSection .listSort span').click(function(){
		//$(this).toggleClass('select');
	})
	
	//Single List Item
	$('.flightListBlock .singleListItem, .onewaySingleItem').click(function(){
		$(this).toggleClass('select');
	})
	
	
    try {
	//Thombnail Slider
	$('.thumpSlider').owlCarousel({
        loop: true,
        items: 1,
        thumbs: true,
        thumbImage: true,
        thumbContainerClass: 'owl-thumbs',
        thumbItemClass: 'owl-thumb-item',
		dots: false,
		nav:true,
    });



	
	//cover Slider
	$('.coverSlider').owlCarousel({
		loop:false,
		margin:10,
		nav:true,
		dots:false,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:2
			},
			
			1000:{
				items:3
			},
			1100:{
				items:4
			}
		}
	});
	
	//Mobile Filter
	$('.mobFilter span').click(function(){
		$('.leftFilter').addClass('open');
		$('body').addClass('fixed');
	});
	
	$('.mobFilterSearch button').click(function(){
		$('.leftFilter').removeClass('open');
		$('body').removeClass('fixed');
	});
	
	//Popup Tab
	$('#flightDetail .nav-item').click(function(){
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
	});
    }
    catch (e) {

    }

    try {
	//Booking Auto Search
	$(".autoSearch").customselect({
		"search": true,
		"mobilecheck":  function() {
		   return 
		   navigator.platform && navigator.userAgent.match(/(android|iphone|ipad|blackberry)/i);
		}
	});
    }
    catch (e) {

    }
	
	//Thumbnail Slider
	$(window).load(function() {
		$('#carousel').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			itemWidth: 150,
			itemMargin: 20,
			asNavFor: '#slider'
		});
	 
	  $('#slider').flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshow: false,
		sync: "#carousel"
		});
	});
	
	//Hotel nav Scroll
    $( ".hotelBreadcrumb a" ).click(function( event ) {
        event.preventDefault();
        $(".rechargeOptions.hotelWrapper").animate({ scrollTop: $($(this).attr("href")).offset().top - 150 }, 500);
    });
	
	//hotel Tarill Slider
	$('.convienceFare h5').click(function(){
		$(this).toggleClass('open').siblings().slideToggle(400);
	});

		//Thumbnail Slider
		$(window).load(function() {
			$('#carousel').flexslider({
				animation: "slide",
				controlNav: false,
				animationLoop: false,
				slideshow: false,
				itemWidth: 150,
				itemMargin: 20,
				asNavFor: '#slider'
			});
		 
		  $('#slider').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			sync: "#carousel"
			});
		});
		
		//Hotel nav Scroll
		$( ".hotelBreadcrumb a" ).click(function( event ) {
			event.preventDefault();
			$(".rechargeOptions.hotelWrapper").animate({ scrollTop: $($(this).attr("href")).offset().top - 150 }, 500);
		});
		
		//hotel Tarill Slider
		$('.convienceFare h5').click(function(){
			$(this).toggleClass('open').siblings().slideToggle(400);
		});
});



//Encryption For Pages Client Server Validation Added By Mithun 2019-25-07

var gridName;
var gridControl;
var gridRow;

var textBoxControls = [];
var hiddenFieldControls = [];
var checkBoxControls = [];
var selectControls = [];
var radioButtonControls = [];
var labelControls = [];

var gridTextBoxControls = [];
var gridHiddenFieldControls = [];
var gridCheckBoxControls = [];
var gridSelectControls = [];
var gridRadioButtonControls = [];
var gridLabelControls = [];

if (document.getElementById("hdnControlIds") != undefined)
    document.getElementById("hdnControlIds").value = "";
if (document.getElementById("hdnControlEncodeVal") != undefined)
    document.getElementById("hdnControlEncodeVal").value = "";
if (document.getElementById("hdnValidateGridName") != undefined)
    document.getElementById("hdnValidateGridName").value = "";
if (document.getElementById("hdnValidateGridControl") != undefined)
    document.getElementById("hdnValidateGridControl").value = "";
if (document.getElementById("hdnGridControlIds") != undefined)
    document.getElementById("hdnGridControlIds").value = "";
if (document.getElementById("hdnGridControlEncodeVal") != undefined)
    document.getElementById("hdnGridControlEncodeVal").value = "";

function EncryptFormValues(textBoxControls, hiddenFieldControls, checkBoxControls, selectControls, radioButtonControls, labelControls, gridName, gridControl,
    gridRow, gridTextBoxControls, gridHiddenFieldControls, gridCheckBoxControls, gridSelectControls, gridRadioButtonControls, gridLabelControls) {
    try {
        var textBoxId = ""; var textBoxVal = "";
        var hiddenId = ""; var hiddenVal = "";
        var checkBoxId = ""; var checkBoxVal = "";
        var selectId = ""; var selectVal = ""; var selectItemVal = "";
        var radioButtonId = ""; var radioButtonVal = "";
        var labelId = ""; var labelVal = "";

        var gridTextBoxId = ""; var gridTextBoxVal = "";
        var gridHiddenId = ""; var gridHiddenVal = "";
        var gridCheckBoxId = ""; var gridCheckBoxVal = "";
        var gridSelectId = ""; var gridSelectVal = ""; var gridSelectItemVal = "";
        var gridRadioButtonId = ""; var gridRadioButtonVal = "";
        var gridLabelId = ""; var gridLabelVal = "";

        document.getElementById("hdnControlIds").value = "";
        document.getElementById("hdnControlEncodeVal").value = "";
        document.getElementById("hdnGridControlIds").value = "";
        document.getElementById("hdnGridControlEncodeVal").value = "";

        if (textBoxControls != null && textBoxControls.length > 0) {
            $.each(textBoxControls, function (key, item) {
                if ($('#' + item).attr('id') != null && $('#' + item).attr('id') != "" && $('#' + item).attr('id') != undefined) {
                    if (textBoxId != null && textBoxId != "")
                        textBoxId += "|" + $('#' + item).attr('id');
                    else
                        textBoxId += $('#' + item).attr('id');

                    textBoxVal += $('#' + item).val();
                }
            });
        }
        if (hiddenFieldControls != null && hiddenFieldControls.length > 0) {
            $.each(hiddenFieldControls, function (key, item) {
                if ($('#' + item).attr('id') != null && $('#' + item).attr('id') != "" && $('#' + item).attr('id') != undefined) {
                    if (hiddenId != null && hiddenId != "")
                        hiddenId += "|" + $('#' + item).attr('id');
                    else
                        hiddenId += $('#' + item).attr('id');

                    hiddenVal += $('#' + item).val();
                }
            });
        }
        if (checkBoxControls != null && checkBoxControls.length > 0) {
            $.each(checkBoxControls, function (key, item) {
                if ($('#' + item).attr('id') != null && $('#' + item).attr('id') != "" && $('#' + item).attr('id') != undefined) {
                    if (checkBoxId != null && checkBoxId != "")
                        checkBoxId += "|" + $('#' + item).attr('id');
                    else
                        checkBoxId += $('#' + item).attr('id');

                    checkBoxVal += $('#' + item).prop('checked');
                }
            });
        }
        if (selectControls != null && selectControls.length > 0) {
            $.each(selectControls, function (key, item) {
                if ($('#' + item).attr('name') != null && $('#' + item).attr('name') != "" && $('#' + item).attr('name') != undefined) {
                    if (selectId != null && selectId != "")
                        selectId += "|" + $('#' + item).attr('name');
                    else
                        selectId += $('#' + item).attr('name');

                    selectVal += $('#' + item).val();
                    selectItemVal += $('#' + item).find('option:selected').text();
                }
            });
        }
        if (radioButtonControls != null && radioButtonControls.length > 0) {
            $.each(radioButtonControls, function (key, item) {
                if ($('#' + item).attr('id') != null && $('#' + item).attr('id') != "" && $('#' + item).attr('id') != undefined) {
                    if (radioButtonId != null && radioButtonId != "")
                        radioButtonId += "|" + $('#' + item).attr('id');
                    else
                        radioButtonId += $('#' + item).attr('id');

                    radioButtonVal += $('#' + item)[0].checked;
                }
            });
        }
        if (labelControls != null && labelControls.length > 0) {
            $.each(labelControls, function (key, item) {
                if ($('#' + item).attr('id') != null && $('#' + item).attr('id') != "" && $('#' + item).attr('id') != undefined) {
                    if (labelId != null && labelId != "")
                        labelId += "|" + $('#' + item).attr('id');
                    else
                        labelId += $('#' + item).attr('id');

                    labelVal += $('#' + item).text();
                }
            });
        }

        if (gridName != null && gridName != undefined && gridName != "" && gridRow != null && gridRow != undefined && gridRow != "") {

            document.getElementById("hdnValidateGridName").value = gridName;
            document.getElementById("hdnValidateGridControl").value = gridControl;

            //Grid Validations
            if (gridTextBoxControls != null && gridTextBoxControls.length > 0) {
                $.each(gridTextBoxControls, function (key, item) {
                    $(gridRow).closest('tr').find("input[type='text']").each(function (gridKey, griditem) {
                        if (griditem.id != null && griditem.id != "" && griditem.id.indexOf(item) !== -1) {
                            if (gridTextBoxId != null && gridTextBoxId != "")
                                gridTextBoxId += "|" + item;
                            else
                                gridTextBoxId += item;

                            gridTextBoxVal += griditem.value;
                        }
                    });
                });
            }
            if (gridHiddenFieldControls != null && gridHiddenFieldControls.length > 0) {
                $.each(gridHiddenFieldControls, function (key, item) {
                    $(gridRow).closest('tr').find("input[type='hidden']").each(function (gridKey, griditem) {
                        if (griditem.id != null && griditem.id != "" && griditem.id.indexOf(item) !== -1) {
                            if (gridHiddenId != null && gridHiddenId != "")
                                gridHiddenId += "|" + item;
                            else
                                gridHiddenId += item;

                            gridHiddenVal += griditem.value;
                        }
                    });
                });
            }
            if (gridCheckBoxControls != null && gridCheckBoxControls.length > 0) {
                $.each(gridCheckBoxControls, function (key, item) {
                    $(gridRow).closest('tr').find("input[type='checkbox']").each(function (gridKey, griditem) {
                        if (griditem.id != null && griditem.id != "" && griditem.id.indexOf(item) !== -1) {
                            if (gridCheckBoxId != null && gridCheckBoxId != "")
                                gridCheckBoxId += "|" + item;
                            else
                                gridCheckBoxId += item;

                            gridCheckBoxVal += griditem.checked;
                        }
                    });
                });
            }
            if (gridSelectControls != null && gridSelectControls.length > 0) {
                $.each(gridSelectControls, function (key, item) {
                    $(gridRow).closest('tr').find("select").each(function (gridKey, griditem) {
                        if (griditem.id != null && griditem.id != "" && griditem.id.indexOf(item) !== -1) {
                            if (gridSelectId != null && gridRadioButtonId != "")
                                gridSelectId += "|" + item;
                            else
                                gridSelectId += item;

                            gridSelectVal += griditem.value;
                            gridSelectItemVal += griditem.innerText;
                        }
                    });
                });
            }
            if (gridRadioButtonControls != null && gridRadioButtonControls.length > 0) {
                $.each(gridRadioButtonControls, function (key, item) {
                    $(gridRow).closest('tr').find("input[type='radio']").each(function (gridKey, griditem) {
                        if (griditem.id != null && griditem.id != "" && griditem.id.indexOf(item) !== -1) {
                            if (gridRadioButtonId != null && gridRadioButtonId != "")
                                gridRadioButtonId += "|" + item;
                            else
                                gridRadioButtonId += item;

                            gridRadioButtonVal += griditem.checked;
                        }
                    });
                });
            }
            if (gridLabelControls != null && gridLabelControls.length > 0) {
                $.each(gridLabelControls, function (key, item) {
                    $(gridRow).closest('tr').find("span").each(function (gridKey, griditem) {
                        if (griditem.id != null && griditem.id != "" && griditem.id.indexOf(item) !== -1) {
                            if (gridLabelId != null && gridLabelId != "")
                                gridLabelId += "|" + item;
                            else
                                gridLabelId += item;

                            gridLabelVal += griditem.innerText;
                        }
                    });
                });
            }
        }

        var ControlIds = {
            hdnTextBoxIds: textBoxId, hdnHiddenFieldIds: hiddenId, hdnCheckBoxIds: checkBoxId, hdnSelectIds: selectId,
            hdnRadioButtonIds: radioButtonId, hdnLabelIds: labelId
        }

        var GridControlIds = {
            gridTextBoxIds: gridTextBoxId, gridHiddenFieldIds: gridHiddenId, gridCheckBoxIds: gridCheckBoxId, gridSelectIds: gridSelectId,
            gridRadioButtonIds: gridRadioButtonId, gridLabelIds: gridLabelId
        }

        document.getElementById("hdnControlIds").value = JSON.stringify(ControlIds);
        document.getElementById("hdnGridControlIds").value = JSON.stringify(GridControlIds);

        var textBoxEncValue = sha1((String(textBoxVal)).toLowerCase());
        var hiddenEncValue = sha1((String(hiddenVal)).toLowerCase());
        var checkboxEncValue = sha1((String(checkBoxVal)).toLowerCase());
        var selectEncValue = sha1((String(selectVal)).toLowerCase());
        var selectItemEncValue = sha1((String(selectItemVal)).toLowerCase());
        var radioButtonEncValue = sha1((String(radioButtonVal)).toLowerCase());
        var labelEncValue = sha1((String(labelVal)).toLowerCase());

        console.log(textBoxEncValue);
        console.log(hiddenEncValue);
        console.log(checkboxEncValue);
        console.log(selectEncValue);
        console.log(selectItemEncValue);
        console.log(radioButtonEncValue);
        console.log(labelEncValue);

        var gridTextBoxEncValue = sha1((String(gridTextBoxVal)).toLowerCase());
        var gridHiddenEncValue = sha1((String(gridHiddenVal)).toLowerCase());
        var gridCheckboxEncValue = sha1((String(gridCheckBoxVal)).toLowerCase());
        var gridSelectEncValue = sha1((String(gridSelectVal)).toLowerCase());
        var gridSelectItemEncValue = sha1((String(gridSelectItemVal)).toLowerCase());
        var gridRadioButtonEncValue = sha1((String(gridRadioButtonVal)).toLowerCase());
        var gridLabelEncValue = sha1((String(gridLabelVal)).toLowerCase());

        var ControlEncVal = {
            hdnTxtEncodeVal: textBoxEncValue, hdnHiddenEncodeVal: hiddenEncValue, hdnChkboxEncodeVal: checkboxEncValue,
            hdnSelectEncodeVal: selectEncValue, hdnSelectItemEncodeVal: selectItemEncValue, hdnRadioButtonEncodeVal: radioButtonEncValue,
            hdnLabelEncodeVal: labelEncValue
        }

        var GridControlEncVal = {
            gridTxtEncodeVal: gridTextBoxEncValue, gridHiddenEncodeVal: gridHiddenEncValue, gridChkboxEncodeVal: gridCheckboxEncValue,
            gridSelectEncodeVal: gridSelectEncValue, gridSelectItemEncValue: selectItemEncValue, gridRadioButtonEncodeVal: gridRadioButtonEncValue,
            gridLabelEncodeVal: gridLabelEncValue
        }

        document.getElementById("hdnControlEncodeVal").value = JSON.stringify(ControlEncVal);
        document.getElementById("hdnGridControlEncodeVal").value = JSON.stringify(GridControlEncVal);
    }
    catch (e) {
        textBoxId = ""; textBoxVal = "";
        hiddenId = ""; hiddenVal = "";
        checkBoxId = ""; checkBoxVal = "";
        selectId = ""; selectVal = ""; selectItemVal = "";
        radioButtonId = ""; radioButtonVal = "";
        labelId = ""; labelVal = "";

        document.getElementById("hdnControlIds").value = "";
        document.getElementById("hdnControlEncodeVal").value = "";

        document.getElementById("hdnValidateGridName").value = "";
        document.getElementById("hdnGridControlIds").value = "";
        document.getElementById("hdnGridControlEncodeVal").value = "";

    }
}
