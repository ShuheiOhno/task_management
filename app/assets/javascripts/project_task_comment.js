$(function(){
  
  $(".project_message_show_btn").on("click", () => {
    $(".project_message_wrapper").show();

    $(".project_message_show_btn").hide();
    $(".project_message_hide_btn").show();
  });

  $(".project_message_hide_btn").on("click", () => {
    $(".project_message_wrapper").hide();

    $(".project_message_show_btn").show();
    $(".project_message_hide_btn").hide();
  });


  $(".task_message_show_btn").on("click", () => {
    $(".task_message_wrapper").show();

    $(".task_message_show_btn").hide();
    $(".task_message_hide_btn").show();
  });

  $(".task_message_hide_btn").on("click", () => {
    $(".task_message_wrapper").hide();

    $(".task_message_show_btn").show();
    $(".task_message_hide_btn").hide();
  });


})