$(document).ready( function() {

  // $(".button-collapse").sideNav();
  // $('.flash').click( function(){
  //   $(this).slideToggle();
  // });

  $('.flash').show(function(){
    var $flash = $(this);
    setTimeout( function(){
      $flash.slideToggle();
    }, 5000);
  });
});