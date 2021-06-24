import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chatBox = document.getElementById("chat-box");
  const currentUserID = parseInt(chatBox.getAttribute("data-user-id"));
  const chatID = parseInt(chatBox.getAttribute("data-chat-id"));

  consumer.subscriptions.create({channel: "ChatChannel", chat_id: chatID}, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel

      if (data.action === "create") {
        if (data.author_id === currentUserID) {
          chatBox.innerHTML += `
          <p id="message-${data.message_id}">
            ${data.message} by: Me <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/chats/${data.chat_id}/messages/${data.message_id}">Delete</a>
          </p>
          `;
        } else {
          chatBox.innerHTML += `
          <p id="message-${data.message_id}">${data.message} by: ${data.username}</p>
          `;
        }
      } else if (data.action === "destroy") {
        document.getElementById(`message-${data.message_id}`).remove();
      }
    }
  });
});