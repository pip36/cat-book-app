$(document).on('turbolinks:load',function(){

  $('.comment-field').focus(function(){
    if ($(this).val() == "write a comment..."){
      $(this).val("");
    };
  });

  $('.replies').css("display","none");
  $('.reply-entry').css("display","none");
  $('.comments').css("display", "none");
  $('.comment-entry').css("display", "none");

  $('.reply-link').click(function(){
    $(this).parents('.post-action-panel').parent().find('.replies').toggle();
    $(this).parents('.post-action-panel').parent().find('.replies').find('.replies').css("display", "none");
  });
  $('.comment-link').click(function(){
    $(this).parents('.post-action-panel').next().find('.comments').toggle();
  });


  $('.reply-post').click(function(){
    $(this).parents('.post-action-panel').next().find('.comment-entry').first().toggle();
  });








});
