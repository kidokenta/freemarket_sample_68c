$(function(){

  $(".tab-A").click(function(){ 
    $(".tab-A").css("background-color","gray")
    $(".listing-tabs").addClass("open");
    $(".tab-B").css("background-color","white")
    $(".tab-C").css("background-color","white")
    $(".tab-content-A").css("display","block");
    $(".tab-content-B").css("display","none");
    $(".tab-content-C").css("display","none");
  });
  
  $(".tab-B").click(function(){
    // $(".tab-B").addClass("open");
    // $(".tab-A").addClass("close");
    // $(".tab-C").addClass("close");
    // $("#next-form-btn").addClass("close");
    $(".tab-A").css("background-color","white")
    $(".tab-B").css("background-color","gray")
    $(".tab-C").css("background-color","white")
    $(".tab-content-A").css("display","none");
    $(".tab-content-B").css("display","block");
    $(".tab-content-C").css("display","none");
  });

  $(".tab-C").click(function(){
    $(".tab-A").css("background-color","white")
    $(".tab-B").css("background-color","white")
    $(".tab-C").css("background-color","gray")
    $(".tab-content-A").css("display","none");
    $(".tab-content-B").css("display","none");
    $(".tab-content-C").css("display","block");
  });
})