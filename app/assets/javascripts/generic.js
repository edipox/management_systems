$(document).on("mobileinit", function(){
  $.mobile.ajaxEnabled = false;
  $.mobile.selectmenu.prototype.options.nativeMenu = false;
});

$(document).ready(function(){
  on_load();
  first_load();
});

function pdffy(){
  $(document).on("click","a[data-pdf='true']",function(){
    var url = $(this).attr("data-href");
    window.open(url, '_blank');
    window.focus();
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

function showNotice(notice){
  if(notice != undefined && notice != null && notice != ''){
    var seconds = notice.length/20
      TINY.box.show({html:notice,animate:true,close:true,mask:false,boxid:'alert',autohide:seconds})
  }
  hideLoader();  
}

function first_load(){
  pdffy();

  $(document).on("ajax:before", function(){
    showLoader();
  }).on("ajax:success", function(){
    hideLoader();
  });
  
  $("#fake_finished_fake").on('change', function() {
    $('input[name="category_finished"]').val(this.value);
  });

  $("#finished_fake").on('change', function() {
    $('input[name="components_category[finished]"]').val(this.value);
  }); 
  
  $(".pagination a").on('click', function() {
  	$.ajax({
  	  type: "GET",
  	  url: $(this).attr("href"),
  	  dataType: "script"
  	});
    showLoader(); 
  	return false;
  });

}

function create_loader(){
  html_loader = '<div id="back_loader" class="loader" style="display: block;"><div class="circle" style=""></div><div class="circle1"></div></div>';
  return $("body").append(html_loader);
}

function showLoader(){
  if($("#back_loader").length == 0){
    create_loader();
  }
  $("#back_loader").fadeIn(100);  
}

function hideLoader(){
  $("#back_loader").fadeOut(100);
}

function on_load(){
  defaultShowForm("category",["category_name", "category_description"]);
  defaultShowForm("brand",["brand_name"]);

  $("form").validate(); 
  trim($(".trim"));
  trim($("*[trim]"));
  
  $("#menu a").click(function(){
    $("#menu .ui-btn-active").removeClass("ui-btn-active");
    $(this).addClass("ui-btn-active")
  });
  
  $("#fake_finished_fake").change(function(){
    $('input[name="category_finished"]').val(this.value);
  })
  
  $("#finished_fake").change(function() {
    $('input[name="components_category[finished]"]').val(this.value);
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
      showLoader(); 
    	return false;
    });
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
      }
  );
}


function changeContent(where, content) {
  var v = $(where).html(content).trigger('create');
  on_load();
  hideLoader();  
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
  
  $("#popup form input").keyup(function(){
      $("#popup #error_explanation").remove();
      $("#popup .field_with_errors").removeClass("field_with_errors");
  });

  $("#popup form").submit(function() {
     setTimeout(function() {
        if($("#popup form").valid() && ! hasError() ){
            $("#popup").hide("fast", function(){
              $("#popup").popup("close");
            });
        }
     },550);
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


