$(function(){

  function buildHTML(message){
    var html =`<div class="chat__messages__message">
                 <div class="chat__messages__message__upper">
                   <div chat__messages__message__upper__username>
                     ${message.name}
                   </div>
                   <div class="chat__messages__message__upper__date">
                     ${message.created_at}
                   </div>
                 </div>
                 <div class="chat__messages__message__lower">
                   <div class="chat__messages__message__lower__content">
                     ${message.content}
                   </div>
                 </div>
              </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href;
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.chat__messages').append(html);
      $('.js-form__message').val('');
      // $('html,body').animate({scrollTop: 500}, 500, 'swing');
      $('.chat__messages').animate({scrollTop: $('.chat__messages')[0].scrollHeight}, 'fast');
    })

    .fail(function(a,b,c){
      console.log(a)
      console.log(b)
      console.log(c)
      alert('error');
    })
    return false;
  })
})
