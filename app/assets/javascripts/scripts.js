$(document).on('turbolinks:load',function(){



  $('.reply-entry').css("display","none");
  $('.comment-entry').css("display", "none");

  $('.reply-link').click(function(){
    $('#new_comment').css('display:none');
    $(this).parents('.post-buttons').next().toggle();
  });

  $('.comment-link').click(function(){
    $('#new_comment').css('display:none');

  $(this).parents('.post-buttons').next().find('.comment-entry').toggle();
  });

  $('#comment_body').focus(function(){
    if ($(this).val() == "write a comment..."){
      $(this).val("");
    };
  });


});
