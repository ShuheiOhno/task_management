$(function(){

  // 完了タスク一覧
  $(".user_task_info_wrapper__complete_hide_btn").on("click", () => {
    $(".complete_task_title").hide();

    $(".user_task_info_wrapper__complete_hide_btn").hide();
    $(".user_task_info_wrapper__complete_show_btn").show();
  })
  
  $(".user_task_info_wrapper__complete_show_btn").on("click", () => {
    $(".complete_task_title").show();

    $(".user_task_info_wrapper__complete_hide_btn").show();
    $(".user_task_info_wrapper__complete_show_btn").hide();
  })


  // 未完了タスク一覧
  $(".user_task_info_wrapper__no_complete_hide_btn").on("click", () => {
    $(".no_complete_task_title").hide();

    $(".user_task_info_wrapper__no_complete_hide_btn").hide();
    $(".user_task_info_wrapper__no_complete_show_btn").show();
  })
  
  $(".user_task_info_wrapper__no_complete_show_btn").on("click", () => {
    $(".no_complete_task_title").show();

    $(".user_task_info_wrapper__no_complete_hide_btn").show();
    $(".user_task_info_wrapper__no_complete_show_btn").hide();
  })

})