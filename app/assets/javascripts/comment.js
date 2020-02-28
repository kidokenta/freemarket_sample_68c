$(function(){
  function buildHTML(comment){
    var html = `<div class="comments-box">
                  <div class="comments-box__nickname">
                   ${comment.user_nickname}</div>
                  <div class="comments-box__text">
                   ${comment.text}</div>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments-history').append(html);
      $('.comment-formarea').val('');
    })
    .fail(function(){
      alert('error');
    })
    .always(function(data){
      $('.btn-send-comment').prop('disabled', false);
    })
  })
});