// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

$(document).bind("mobileinit", function(){
  $.mobile.ajaxEnabled = false;
  $.mobile.selectmenu.prototype.options.nativeMenu = false;
});

$(document).ready(function(){
  on_load();
});

function showNotice(notice){
//  if(notice){
      alert(notice);  
//  }
/*  
    - if notice  
%div#notice_container
  %span{ "class"=>"ui-icon ui-icon-alert", "style"=>"width:17px; display:block;"}              
  %div#notice= notice */
}

function on_load(){
  defaultShowForm("category",["category_name", "category_description"]);
  defaultShowForm("brand",["brand_name"]);
   
//  showFakeSubForm('#category_button', '#categorySubForm', '#category_select');

  $("form").validate(); 
  trim($(".trim"));
  trim($("*[trim]"));
  
  $("#menu a").click(function(){
    $("#menu .ui-btn-active").removeClass("ui-btn-active");
    $(this).addClass("ui-btn-active")
  });
  ajaxifyPagination();
};

function ajaxifyPagination() {
    $(".pagination a").click(function() {
    	$.ajax({
    	  type: "GET",
    	  url: $(this).attr("href"),
    	  dataType: "script"
    	});
    	return false;
    });
}

function trim(element){
    $.each($.makeArray(element), function(i, val){
       var maxLength = eval($(val).attr("data-trim"));
       maxLength = maxLength == undefined || maxLength == 0 || maxLength == "" || isNaN(maxLength) ? 20 : maxLength;
       var s = $(val).text();
       $(val).text(s.length > maxLength ? s.substr(0,maxLength-3)+"..." : s);
    })
}

function defaultShowForm(element, fields){
 showFakeSubForm('#'+element+'_button', '#'+element+'SubForm', '#'+element+'_select', fields, "new_"+element+"");
}


function showFakeSubForm(caller, subform, select, required_fields, existence_field){
 return $(caller).toggle(
      function () {
        $(select).hide();
        $(subform).show();
        var e = $(caller+" .ui-icon-plus");
        $(e).removeClass("ui-icon-plus");
        $(e).addClass("ui-icon-delete");

        $('#'+existence_field).val('true');
        if(required_fields){
          for(var i = 0; i < required_fields.length; i++){
            $('#'+required_fields[i]).addClass('required');    
          }
        }
//        $('#category_name').addClass('required');
//        $('#category_description').addClass('required');
      },      function () {
        $(select).show();
        $(subform).hide();
        var e = $(caller+" .ui-icon-delete");
        $(e).removeClass("ui-icon-delete");
        $(e).addClass("ui-icon-plus");

        $('#'+existence_field).val('false');
        if(required_fields){
          for(var i = 0; i < required_fields.length; i++){
            $('#'+required_fields[i]).removeClass('required');    
          }
        }

//        $('#category_name').removeClass('required');
//        $('#category_description').removeClass('required');
      }
  );
}


function changeContent(where, content) {
  var v = $(where).html(content).trigger('create');
  on_load();
  return v;
};

function changeSelectedButton(where, selected) {
  $(where + ' [data-role="button"]').removeClass($.mobile.activeBtnClass);
  $(selected).addClass($.mobile.activeBtnClass);
}

function hasError(){
  return $("#popup .field_with_errors").length != 0 || $("#popup #error_explanation").length != 0
}

function openPopup(content){
  changeContent('#popup', content ).show().popup("open");
  
  $("#popup form input[type='submit']").click(function(){
      $("#popup #error_explanation").hide(200, function(){
        $(this).remove();
        $("#popup .field_with_errors").removeClass("field_with_errors");
        $("#popup form").submit();    
      });
  });
  
  $("#popup form").submit(function() {
     setTimeout(function() {
        if($("#popup form").valid() && ! hasError() ){
            $("#popup").hide("normal", function(){
              $("#popup").popup("close");
            });
        }
     },100);
  });
  
  $("#popup form").validate();
  $("#popup .cancel").click(function(){
     $("#popup").slideUp("fast", function(){
       $("#popup").popup("close");
     });
  });
  
}


function showPopup(popup, content){
  openPopup(content);
}


