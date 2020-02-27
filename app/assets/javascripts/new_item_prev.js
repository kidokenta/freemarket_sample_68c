$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});

// $(function(){
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#img-file').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var file = $('input[type="file"]').prop('files')[0];
//     //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//     // var fileReader = new FileReader();
//     console.log(file)

//     function readimg(){
//       var fileReader = new FileReader();
//       reader.onloadend = function() {img.src = fileReader.result;}
//       if (event.target.files[0]) {fileReader.readAsDataURL(event.target.files[0]);}
//       }

//     document.getElementById('#img-file').onChange = readimg;
//     //読み込みが完了すると、srcにfileのURLを格納
//     fileReader.onloadend = function() {
//       var src = fileReader.result
//       var html= `<img src="${src}" width="114" height="80">`
//       //image_box__container要素の前にhtmlを差し込む
//       $('.image-box__container').before(html);
//     }
//     fileReader.readAsDataURL(file);
//   });

// });