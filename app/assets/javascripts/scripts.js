$(document).on('turbolinks:load',function(){

  $('.reply-form').css("display","none");
  $('.comment-form').css("display", "none");

  $('.reply-link').click(function(){
    $('.reply-form').css("display","none");
    $(this).next().css("display","block");
  });

  $('.comment-link').click(function(){
    $('.comment-form').css("display","none");
    $(this).next().css("display","block");
  });

});
