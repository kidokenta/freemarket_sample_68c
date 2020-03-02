$(function(){
  $(".delete-btn").click(function(e) {
    e.preventDefault();
    var image_id = $(this).data("imgid")
    // 新規で画像をいれらときはlengthは「0」になる
    if ( image_id.length != 0 ) {
        $.ajax({
            // Api::ProductsControllerのimage_destroyに飛ぶ
            type: 'DELETE',
            url: '/api/destroy/image_destroy',
            data: {img_id: image_id},
            dataType: 'json'
        })
        .done(function() {
            alert("削除しました");
        })
        .fail(function() {
            alert("削除に失敗しました");
        });
    }
  });

  var buildPrompt = `<option value>---</option>`
    var buildHtmlOption = function(cat) {
        var option = `<option value ="${cat.id}">${cat.name}</option>`
        return option
    }
    var buildInputFile = function(num) {
        var input = `<input data-id="${num}" type="file" name="product[images_attributes][${num}][image]" id="product_images_attributes_${num}_image">`
        return input
    }
    var product_img = $('.product_image')
    if (product_img.length)
        product_img.parents('.sell__image-select__ul-text').css('opacity',1);
        product_img.parent().next('.btn-box').css('display','block');

    $(".product-detail__top__item-image-list__inner").on({
        'mouseenter': function() {
            var child = $(this).children();
                url = $(child).attr('src');
                inner_id = $(child).data('inner_id');
                photo = $('.product-detail__top__item-image-main--photo');
                main = $("#main_" + inner_id);
            $(photo).fadeOut();
            $(main).fadeIn();
        }
    });

    $('.sell__image-select__ul-text').on('change', 'input[type="file"]', function(e) {
        var id = $(this).data('id'),
            file = e.target.files[0],
            reader = new FileReader(),
            $label = $(".ul-id-" + id),
            $li = $label.children('li')
    
        // 画像ファイル以外の場合は何もしない
        if(file.type.indexOf("image") < 0){
            return false;
        }
    
        // ファイル読み込みが完了した際のイベント登録
        reader.onload = (function(file) {
            return function(e) {
                // liの中を削除する
                $li.empty();
                // 透過していた領域を表示する
                $label.css('opacity', '1');
                // 領域の中にロードした画像を表示するimageタグを追加
                $li.append($('<img>').attr({
                    src: e.target.result,
                    width: "114px",
                    height: "116px",
                    class: "preview",
                    title: file.name,
                }));
                // 編集削除ボタンを表示する
                $('.btn-box').css('display', 'block');
            };
        })(file);
    
        reader.readAsDataURL(file);
    });



// 削除ボタンクリック
    $(this).on("click", ".delete-btn", function() {
        var input = $(this).parent().siblings('input');
        var num = $(input).data('id');
        $(this).parent().prev().empty();
        $(input).remove();
        var html = buildInputFile(num)
        $(this).parent().parent().append(html);
        $(this).parent().parent().css('opacity', '0');
        return false;
    });
});