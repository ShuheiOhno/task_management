$(function(){

  function buildHTML(comment){
    if ( comment.image.url ) {
      let html =
        `<div class="comment_list_wrapper">
          <div class="comment_content">
            コメント:
            ${comment.content}
          </div>
            <div class="comment_image">
             <img src="${comment.image.url}" class="json_image" >
            </div>
          <div class="comment_user_name">
          ${comment.user_name}
          さん
          </div>
          <div class="comment_time">
          ${comment.created_at}
          </div>
        </div>`
      return html;
    } else {
      let html =
      `<div class="comment_list_wrapper">
      <div class="comment_content">
      コメント:
      ${comment.content}
      </div>
      <div class="comment_user_name">
      ${comment.user_name}
      さん
      </div>
      <div class="comment_time">
      ${comment.created_at}
      </div>
      </div>`
      return html;
    };
  }

  $(".form_comment").on("submit", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type:"POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      console.log(html)
      $('.comment_list').prepend(html);      
      $('.form_comment')[0].reset();
      $(".submit_btn").prop('disabled', false);
      // $(".comment_submit_btn").prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });


  $(".readme_btn").on("click", () => {
    $(".readme").toggle();
  })

});
