$(function(){

  function buildHTML(message){
    var image = '';
    message.image == null? image = '': image = `<img class="lower-message__image" src="${message.image}">`;

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
                     ${image}
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
      $('.chat__messages').animate({scrollTop: $('.chat__messages')[0].scrollHeight}, 'fast');
    })

    .fail(function(){
      alert('error');
    })
    return false;
  })
})
