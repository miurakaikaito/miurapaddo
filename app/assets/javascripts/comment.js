$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a class="comments_name"href=/users/${comment.user_id}>${comment.user_name}</a>
                  </strong>
                  <div class="comments_text">
                    ${comment.text}
                  </div>
                </p>`
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
      $('.comments').append(html)
      $('.textbox').val('')
      $('.form__submit').prop('disabled', false);
      $('.side').animate({scrollTop: $('.side')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('error');
    })
  })
 });
 
