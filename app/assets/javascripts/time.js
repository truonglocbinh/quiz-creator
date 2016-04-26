$(document).on("ready page:load",function(){
  var clock = $("#clock")
  var status = clock.attr("data-status")
  var time_limit = clock.attr("data-time-limit")
  var time_start = clock.attr("data-time-start")
  var time = time_limit * 60
  if(time_limit > 0){
    setInterval(function(){
    if (time > 0 && status != "init" && status != "finished"){
      var c = time--
      var h = c / 3600 >> 0
      if (h.toString().length > 1){
        var hour = "" + h
      } else {
        var hour = "0" + h
      }
      var m = (c - h * 3600) / 60 >> 0
      if (m.toString().length > 1){
        var min = "" + m
      }else {
        var min = "0" + m
      }
      var s = c - (m * 60 + h * 3600) >> 0
      if (s.toString().length > 1){
        var sec = "" + s
      }else{
        var sec = "0" + s
      }
      clock.text(hour + ":" + min + ":" + sec);
    }else{
      if(status == "starting"){
        $("#finish").click();
      }
      clock.text("00:00:00");
    }
   }, 1000);
  }else {
    clock.text("00:00:00");
  }
  
});
