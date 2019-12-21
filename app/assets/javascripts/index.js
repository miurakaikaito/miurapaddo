$(document).on('turbolinks:load', function() {
  $(function(){
      $('.slider').slick({
        accessibility: true,
        speed: 1000,
        infinite: true,
        autoplay:true,  
        dots:true, 
      });
  });



  (function() {
    var current = 1
  
    $('#tab').on('click', 'li', function(event) {
      changeTab($(this).data('id'))
    })
    $("#tab").on('keypress', 'li', function(event) {
      if (event.keyCode == 13) {
        changeTab($(this).data('id'))
      }
    })
  
    function init() {
      changeTab(current)
    }
  
    function changeTab(id) {
      $('#content section:not([data-id="' + id + '"])').removeClass('active')
      $('#content section[data-id="' + id + '"]').addClass('active')
      $('#tab li:not([data-id="' + id + '"])').removeClass('active')
      $('#tab li[data-id="' + id + '"]').addClass('active')
    }
    init()
  })()
});
