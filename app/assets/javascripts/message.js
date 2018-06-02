$(function(){

  function buildHTML(message){
    var image = '';
    message.image == null? image = '': image = `<img class="lower-message__image" src="${message.image}">`;

    var html =`<div class="chat__messages__message" data-message-id="${message.id}">
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
                   <div>
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

  $(function(){
    setInterval(update, 5000);
  });
  function update(){
    var new_msgId = $('.chat__messages__message').last().data('message-id');
    $.ajax({
      Url: location.pathname,
      type: 'GET',
      data: { id: new_msgId},
      dataType: 'json'
    })
    .done(function(data){
      if (data.length !== 0){
        data.forEach(function(data){
          var html = buildHTML(data);
          $('.chat__messages').append(html);
          $('.chat__messages').animate({scrollTop: $('.chat__messages')[0].scrollHeight}, 'fast');
        })
      }
    })
    .fail(function(){
      alert('ettor')
    })
  }
})
