$(function(){

  // タスク一覧
  $(".task_list_hide").on("click", () => {
    $(".task").hide();

    $(".task_list_hide").hide();
    $(".task_list_display").show();
  })

  $(".task_list_display").on("click", () => {
    $(".task").show();

    $(".task_list_hide").show();
    $(".task_list_display").hide();
  })

})