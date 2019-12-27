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
});
