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
  $(".to_validate").validate(); 
}

function showFakeSubForm(caller, subform, select){
 return $(caller).toggle(
      function () {
        $(select).hide();
        $(subform).show();
        var e = $(caller+" .ui-icon-plus");
        $(e).removeClass("ui-icon-plus");
        $(e).addClass("ui-icon-delete");
      },      function () {
        $(select).show();
        $(subform).hide();
        var e = $(caller+" .ui-icon-delete");
        $(e).removeClass("ui-icon-delete");
        $(e).addClass("ui-icon-plus");
      }
  );
}


function changeContent(where, content) {
  return $(where).html(content).trigger('create');
};


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

function openPopup(content){
  if(_POPUP.current != null){ 
    _POPUP.back = _POPUP.current;
  }
  _POPUP.current = new PopupLevel(content);
  _POPUP.current.open();
}

function closePopup(){
  if(_POPUP.back == null && _POPUP.current != null){
      _POPUP.current.close();
      _POPUP.current = null;
  }else if(_POPUP.current != null){
    _POPUP.current = _POPUP.back;
    _POPUP.back = _POPUP.back == null ? null : _POPUP.back.back;
    _POPUP.current.open();
  }
}

function showPopup(popup, content){
  openPopup(content);
  $("#popup .closer").click(closePopup);
}


