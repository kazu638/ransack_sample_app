document.addEventListener("turbolinks:load", () => {
  $("form").on("click", ".remove_fields", function(event) {
    // thisは.remove_fields
    // closestはjqueryメソッド。親要素を取得できる。
    // removeは自身の要素に加えて子要素も削除（紐づけられたイベントも削除）
    // ここでは検索フォームを削除
    $(this).closest(".field").remove();
    // aタグのクリックしてリンク先に飛ぶ動作をキャンセルしている。
    event.preventDefault();
  });

  $("form").on("click", ".add_fields", function(event) {
    time = new Date().getTime();
    regexp = new RegExp($(this).data("id"), "g");
    $(this).before($(this).data("fields").replace(regexp, time));
    event.preventDefault();
  });
})