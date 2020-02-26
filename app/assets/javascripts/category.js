
$(function(){
  
  $(".test-d").click(function(){
        var text = $(this).text();
        let element = document.getElementById(text); // 移動させたい位置の要素を取得
        var rect = element.getBoundingClientRect();
        var position = rect.top;    // 一番上からの位置を取得
        $('body,html').animate({scrollTop:position}); 
  })    
})

function scrollToTop() {
  scrollTo(0, 0)
 }