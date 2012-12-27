  function z(str){
    return Sizzle(str)
  }


  function number_pages() {
    var vars={};
    var x=document.location.search.substring(1).split('&');
    for(var i in x) {var z=x[i].split('=',2);vars[z[0]] = unescape(z[1]);}
    var x=['frompage','topage','page','webpage','section','subsection','subsubsection'];
    for(var i in x) {
      var y = document.getElementsByClassName(x[i]);
      for(var j=0; j<y.length; ++j){
        y[j].textContent = vars[x[i]] == undefined ? 1 : vars[x[i]];
      }
    }
  }
  function trim_js() {
    var to_trim = document.getElementsByClassName("trim");
    for (var i= 0; i < to_trim.length; i++){
       var maxLength = 18;
       var s = to_trim[i].textContent;
       to_trim[i].textContent = s.length > maxLength ? s.substr(0,maxLength-3)+"..." : s;
    }
  }
  
  function  remove_items(list){
    for(var j = 0; j < list.length; j++){
      list[j].parentElement.removeChild(list[j]);          
    }
  }

  function odd_style(){
    var odds = z("li:nth-of-type(odd)");
    for (var i in odds){
      odds[i].className += " odd";
    }
  }
  
  function remove_last_column(){
    var letters = ["z", "a", "b", "c", "d", "e", "f", "g", "h"]
    for( var i = 0; i < letters.length; i++){
      var last_grids = z(".ui-grid-"+letters[i]);
      if(last_grids.length != 0){

        var last_blocks = z(".ui-grid-"+letters[i]+" .ui-block-"+letters[i+1])
        remove_items(last_blocks)

        for(var k = 0; k < last_grids.length; k++){
          last_grids[k].className = "ui-grid-"+letters[i-1]
        }
        
      }
    }
  }
  
  function remove_all_links(){
    remove_items(z("a"));
  }
  
  function remove_pagination(){
    remove_items(z(".previous_page"));
    remove_items(z("em.current"));
  }
  
  function on_load_pdf(kind){
    trim_js();
    number_pages();
    odd_style();
    if(kind != "keep_column"){
      remove_last_column();
    }
    remove_all_links();
    remove_pagination();
  }
