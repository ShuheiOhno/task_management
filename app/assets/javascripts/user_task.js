$(function(){
  $(".user_task_hide_btn").on("click",() =>{
    $(".user_task_comment_list").hide();

    $(".user_task_hide_btn").hide();
    $(".user_task_display_btn").show();
  });

  $(".user_task_display_btn").on("click",() =>{
    $(".user_task_comment_list").show();

    $(".user_task_hide_btn").show();
    $(".user_task_display_btn").hide();
  });

})