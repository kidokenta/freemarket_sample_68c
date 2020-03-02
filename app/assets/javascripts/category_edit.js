

$(function(){
  
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper_edit'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_category_edit" name="">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.listing-product-detail__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper_edit'>
                              <div class='listing-select-wrapper__box'>
                                <select class="listing-select-wrapper__box--select" id="grandchild_category_edit" name="category_id">
                                  <option value="---" data-category="---" >---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.listing-product-detail__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category_edit').on('change', function(){
    var parentCategory = $("#parent_category_edit option:selected").text(); //選択された親カテゴリーの名前を取得
    if (parentCategory != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children_edit',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper_edit').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper_edit').remove();
        $('#size_wrapper_edit').remove();
        $('#brand_wrapper_edit').remove();
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
      $('#grandchildren_wrapper_edit').remove();
      $('#size_wrapper_edit').remove();
      $('#brand_wrapper_edit').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.listing-product-detail__category').on('change', '#child_category_edit', function(){
    var childId = $('#child_category_edit option:selected').data('category'); //選択された子カテゴリーのidを取得
    console.log(childId)
    if (childId != ""){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren_edit',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper_edit').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper_edit').remove();
          $('#brand_wrapper_edit').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper_edit').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper_edit').remove();
      $('#brand_wrapper_edit').remove();
    }
  });
});