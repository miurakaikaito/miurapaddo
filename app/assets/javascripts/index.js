$(document).on('turbolinks:load', function() {
  $(function(){
    $(".slider").not('.slick-initialized').slick({
        accessibility: true,
        speed: 1000,
        infinite: true,
        autoplay:true,  
        autoplaySpeed: 1500,
        dots:true, 
      });
  });
});
