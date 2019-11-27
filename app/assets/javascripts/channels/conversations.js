$(function () {
  $('[data-channel-subscribe="conversation"]').each(function (index, element) {
    var $element = $(element);
    currentId = $element.data('current-id');
    conversationId = $element.data('conversation-id');
    messageTemplate = $('[data-role="message-template"]');
    $('.chat-zone').scrollTop($element.prop('scrollHeight'));

    App.cable.subscriptions.create({ channel: 'ConversationChannel', conversation: conversationId },
      {
        received: function (data) {
          renderMessages(data, $element)
          removeMessageNumber(data)
          renderLastMessage(data)
        }
      }
    );
  });

  function removeMessageNumber(data){
    $('.link-conversation').each(function (index, value) {
      if (parseInt(value.id) === data.conversation_id && data.user_id === currentId) {
        $('#conversation-number' + value.id)[0].classList.remove('d-flex')
        $('#conversation-number' + value.id)[0].classList.add('d-none')
      }
    });
  }

  function renderLastMessage(data) {
    $('.link-conversation').each(function (index, value) {
      if (parseInt(value.id) === data.conversation_id) {
        if (currentId === data.user_id) {
          $('#message' + value.id).html('<b>Tú:</b><span> ' + data.message + '</span>')
        } else {
          $('#message' + value.id).html('<span> ' + data.message + '</span>')
        }
      }
    });
  }

  function renderMessages(data, element) {
    var content = messageTemplate.children().clone(true, true);
    setMessagesStyles(data.user_id, content)
    content.find('[data-role="message-text"]').text(data.message);
    element.append(content);
    $('.chat-zone').animate({ scrollTop: element.prop('scrollHeight') }, 1000);
  }

  function setMessagesStyles(userId, content) {
    if (userId === currentId) {
      content[0].classList.add('justify-content-end');
      content.children()[0].classList.add('chat-message-container-me');
    } else {
      content.children()[0].classList.add('chat-message-container');
    }
  }
});
