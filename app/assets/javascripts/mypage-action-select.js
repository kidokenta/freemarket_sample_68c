$(function(){
  $(".like-btn").click(function(){
    $(".like-main").addClass("open");
    $(".buyed-main").removeClass("open");
    $(".selled-main").removeClass("open");
  });

  $(".selled-btn").click(function(){
    $(".selled-main").addClass("open");
    $(".buyed-main").removeClass("open");
    $(".like-main").removeClass("open");
  });

  $(".buyed-btn").click(function(){
    $(".buyed-main").addClass("open");
    $(".like-main").removeClass("open");
    $(".selled-main").removeClass("open");
  })
})