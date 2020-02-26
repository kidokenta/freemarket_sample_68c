$(function(){
  $(".new-user").click(function(){
    $(".new--user--modal").addClass("open");
  })
  $(".close-button").click(function(){
    $(".new--user--modal").removeClass("open");
  })
})