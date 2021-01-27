import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const  japanStandardTime = new Date().toLocaleString({ timeZone: 'Asia/Tokyo' });
    const html = `
    <div class="message">
      <div class="upper-message">
        <div class="messenger">
          ${data.user.name}
        </div>
        <div class="send-time">
          ${japanStandardTime}
        </div>
      </div>
      <div class="lower-message">
        <div class="message-content">
          ${data.message.content}
        </div>
      </div>
    </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value = '';
  }
});



// htmlは変更する