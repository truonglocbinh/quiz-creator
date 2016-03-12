// This is a manifest file that"ll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin"s vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It"s not advisable to add code directly here, but if you do, it"ll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require fancybox
//= require ckeditor/init
//= require_tree .

$(document).on("page:change", function(){
  $(".alert").delay(2000).slideUp(500, function(){
        $(".alert").alert("close");
  });

  $(".question-select").change(function(){
    var type = $(this).val();
    if(type == "text"){
      $(".choice").hide();
      $(".fields").find("input[type=checkbox]").attr("checked",false);
      $(".remove-answer").find("input[type=hidden]").val("1");
    }else if(type == "single_choice"){
      $(".choice").show();
      $(".choice").find(".fields").each(function(index){
        if(index != 0){
          $(this).remove();
        }else{
          $(".fields").find("input[type=text]").val("");
        }
      });
      $(".fields").find("input[type=checkbox]").attr("checked",false);
    }else{
      $(".choice").show();
      $(".choice").find(".fields").each(function(index){
        if(index != 0){
          $(this).remove();
        }else{
          $(".fields").find("input[type=text]").val("");
        }
      });
    }
  });

  $(document).on("click",".checkbox-question input[type=checkbox]", function(){
    var elem = $(this);
    var id = $(this).attr("id");
    console.log(id)
    setTimeout(function(){
      var type = $(".question-select").val();
      var ischecked = elem.val();
      if(type == "single_choice"){
        if(ischecked == 1){
          $(".fields").find("input[type=checkbox]").attr("checked",false);
          $("#" + id).prop("checked",true);
        }
      }
    },50);
  });

  $(document).on("input","#filter-email", function(){
    var role = $("#filter-role").val()
    var email = $("#filter-email").val()
    filter_user(email, role)
  });

  $(document).on("change","#filter-role", function(){
    var role = $("#filter-role").val()
    var email = $("#filter-email").val()
    filter_user(email, role)
  });

});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function filter_user(email, role){
   $.ajax({
    url:  "/api/users",
    type: "GET",
    data: {role: role, email: email},
    success: function(data){
      $(".user-data").remove();
      $(".pagination").remove();
      $("tbody").append(data);
    }
    })
}
