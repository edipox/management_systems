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
  
  $("a").click(function(){
    $(".ui-btn-active").removeClass("ui-btn-active");
    $(this).addClass("ui-btn-active")
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


function PopupLevel(_content){
  this.content = _content;
  this.current = null;
  this.back = null;
  this.open = function(){
    changeContent("#popup", this.content).popup("open");
    $("#popup").bind({
       popupafterclose: closePopup
    });
  };
  this.close = function(){
    changeContent("#popup", this.content).popup("close");
  };
}

var _EVENT = null;
var _UI = null;

var _POPUP = new PopupLevel("");

var id = 0;

function openPopup(content){

//  $("#popup input[type='submit']").click(function(){
//      $("#popup").popup("close");
//  });


//  changeContent('#popup', content ).popup("open");
//  $("#popup input[type='submit']").click(function(){
//      $("#popup").popup("close");
//  });


  changeContent('#content', content);

//  on_load();
//  if(_POPUP.current != null){ 
//    _POPUP.back = _POPUP.current;
//  }
//  _POPUP.current = new PopupLevel(content);
//  _POPUP.current.open();
}

function closePopup(){
/*  if(_POPUP.back == null && _POPUP.current != null){
      _POPUP.current.close();
      _POPUP.current = null;
  }else if(_POPUP.current != null){
    _POPUP.current = _POPUP.back;
    _POPUP.back = _POPUP.back == null ? null : _POPUP.back.back;
    _POPUP.current.open();
  }*/
}

function showPopup(popup, content){
  openPopup(content);
  $("#popup .closer").click(closePopup);
}


