
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

  $('.answer_question').click(function(e){
  	 e.preventDefault();
      var target = e.target
        $.ajax({
         url:$(target).attr('href'),
          method:'GET'
    })
        .done(function(response){
      	$('#answers_link').hide();
        $('.ajax_question').append(response);
    })
  })
      
  $('.comment_question').click(function(e){
  	 e.preventDefault();
      var target = e.target
         $.ajax({
          url:$(target).attr('href'),
            method:'GET'
    })
        .done(function(response){
        $('#comment_link').hide();
        $('.ajax_question').append(response);
    })
  })
  // $('.lc').click(function(e){
  //   e.preventDefault();
  //   var target = e.target
  //   $.ajax({
  //     url:$(target).attr('href'),
  //     method:'get'
  //   })
  //   .done(function(response){
  //     $('#leave_comment').hide();
  //     $(target).append(response);
  //   })
  // })


  //   $('.edits').on('click', 'span', function(e){
  //   $('#edit_link').remove();
  //   e.preventDefault();
  //   var target = e.target
  //   $.ajax({
  //     url:$(target).attr('href'),
  //     method:'GET'
  //   })
  //   .done(function(response){
  //     $(target).append(response);
  //   })
  // })
})
 

