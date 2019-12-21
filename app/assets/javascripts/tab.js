$(document).on('turbolinks:load', function() {

  $(function() {
  
    // ①タブをクリックしたら発動
    $('.user-index_lists li').click(function() {
  
      // ②クリックされたタブの順番を変数に格納
      var index = $('.user-index_lists li').index(this);
  
      // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
      $('.user-index_lists li').removeClass('active');
  
      // ④クリックされたタブにクリック済みデザインを適用する
      $(this).addClass('active');
  
      // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
      $('.user-index_center ul').removeClass('user-index_main').eq(index).addClass('user-index_main');
  
    });
  });
});