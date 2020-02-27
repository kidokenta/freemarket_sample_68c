$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(size){
    var html = `<option value="${size.id}" data-size="${size.id}">${size.size}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper_edit'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_size_edit" name="size">
                            <option value="---" data-size="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.listing-product-detail__size').append(childSelectHtml);
  }
  // 親カテゴリー選択後のイベント

  $('#parent_size_edit').on('change', function(){

    var parentSize = $("#parent_size_edit option:selected").text(); //選択された親カテゴリーの名前を取得
    if (parentSize != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_size_children_edit',
        type: 'GET',
        data: { parent_size: parentSize },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper_edit').remove(); //親が変更された時、子以下を削除するする
        $('#size_wrapper_edit').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper_edit').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#size_wrapper_edit').remove();
      $('#brand_wrapper').remove();
    }
  });
});