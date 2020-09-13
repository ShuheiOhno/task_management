$(function(){
  // 返信
  $(".reply_list_hide_click").on("click",() =>{
    $(".reply_list").hide();

    $(".reply_list_hide_click").hide();
    $(".reply_list_display_click").show();
  });

  $(".reply_list_display_click").on("click",() =>{
    $(".reply_list").show();

    $(".reply_list_hide_click").show();
    $(".reply_list_display_click").hide();
  });

  // 受信
  $(".receive_list_hide_click").on("click",() =>{
    $(".receive_list").hide();

    $(".receive_list_display_click").show();
    $(".receive_list_hide_click").hide();
  });

  $(".receive_list_display_click").on("click",() =>{
    $(".receive_list").show();

    $(".receive_list_display_click").hide();
    $(".receive_list_hide_click").show();
  });

  // 送信
  $(".send_list_hide_click").on("click",() =>{
    $(".send_list").hide();

    $(".send_list_hide_click").hide();
    $(".send_list_display_click").show();
  });

  $(".send_list_display_click").on("click",() =>{
    $(".send_list").show();

    $(".send_list_hide_click").show();
    $(".send_list_display_click").hide();
  });


})