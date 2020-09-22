$(function(){
  $(".project_detail_join_user_hide").on("click", () => {
    $(".project_detail_join_user").hide();

    $(".project_detail_join_user_hide").hide();
    $(".project_detail_join_user_show").show();
  });

  $(".project_detail_join_user_show").on("click", () => {
    $(".project_detail_join_user").show();

    $(".project_detail_join_user_show").hide();
    $(".project_detail_join_user_hide").show();
  });


  $(".project_detail_show").on("click", () => {
    $(".project_detail_some_wrapper").show();

    $(".project_detail_hide").show();
    $(".project_detail_show").hide();
  });

  $(".project_detail_hide").on("click", () => {
    $(".project_detail_some_wrapper").hide();

    $(".project_detail_hide").hide();
    $(".project_detail_show").show();
  });


})