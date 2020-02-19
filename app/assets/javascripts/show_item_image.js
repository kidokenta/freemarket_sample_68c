$(function () {
  $(".image__sub__thumb").first().addClass("active"); 
  $('.image__sub__thumb__photo').click(function () { 
    image_url = $(this).attr("src"); 
    $(".image__main__photo").attr("src", image_url).hide().fadeIn(); 
    $(".image__sub__thumb.active").removeClass("active"); 
    $(this).parent().addClass("active"); 
  });
});