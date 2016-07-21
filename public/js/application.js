$(document).ready(function() {
  $('body').mouseover(function() {
    if (event.pageY < 70){
      $('nav').slideDown( "slow" );
    }
  });
  $('body').mouseover(function() {
    if (event.pageY > 150){
      $('nav').slideUp( "slow" );
    }
  });


});
