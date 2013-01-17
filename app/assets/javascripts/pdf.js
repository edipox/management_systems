  function z(str){
    return Sizzle(str)
  }
  
  function trim() {
    var to_trim = document.getElementsByClassName("trim");
    for (var i= 0; i < to_trim.length; i++){
       var trim_attr_value = to_trim[i].getAttribute("data-trim")
       var maxLength = trim_attr_value ? trim_attr_value : 20;
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
    remove_items(z(".next_page"));
  }
  
  function on_load_pdf(kind){
    trim();
    odd_style();
    if(kind != "keep_column"){
      remove_last_column();
    }
    remove_all_links();
    remove_pagination();
  }