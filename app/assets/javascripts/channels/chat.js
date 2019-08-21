App.chat = App.cable.subscriptions.create('ChatChannel', {
  received: function (data) {
    renderLastMessage(data)
  },
});

function renderLastMessage(data) {
  $('.link-conversation').each(function (index, value) {
    if(parseInt(value.id) === data.conversation.id) {
      $('#message' + value.id).html('<span> ' + data.message.message + '</span>')
      renderMessageNumber(data, value.id)
    }
  });
}

function renderMessageNumber(data, elementId) {
  $('#conversation-number' + elementId)[0].classList.add('d-flex')
  $('#conversation-number' + elementId).first().text(data.size)
}
