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

function on_load(){
  showFakeSubForm('#category_button', '#categorySubForm', '#category_select');
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

function showFakeSubForm(caller, subform, select){
 return $(caller).toggle(
      function () {
        $(select).hide();
        $(subform).show();
        var e = $(caller+" .ui-icon-plus");
        $(e).removeClass("ui-icon-plus");
        $(e).addClass("ui-icon-delete");

        $('#new_category').val('true');
        $('#category_name').addClass('required');
        $('#category_description').addClass('required');
      },      function () {
        $(select).show();
        $(subform).hide();
        var e = $(caller+" .ui-icon-delete");
        $(e).removeClass("ui-icon-delete");
        $(e).addClass("ui-icon-plus");

        $('#new_category').val('false');
        $('#category_name').removeClass('required');
        $('#category_description').removeClass('required');
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

function openPopup(content){
  changeContent('#popup', content ).show().popup("open");
  $("#popup form").submit(function() {
      if($("#popup form").valid()){
          $("#popup").hide("normal", function(){
            $("#popup").popup("close");
          });
      }
  });
  $("#popup form").validate();
  $("#popup .cancel").click(function(){
     $("#popup").slideUp("normal", function(){
       $("#popup").popup("close");
     });
  });
//  on_load();
}


function showPopup(popup, content){
  openPopup(content);
}


