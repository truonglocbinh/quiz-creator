setInterval(getNotifications, 3000);
  function getNotifications(){
	  $.ajax({
	  url:  "/api/notifications",
	  type: "GET",
	  success: function(data){
	  }
	 });
}