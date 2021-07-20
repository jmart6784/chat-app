import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chatBox = document.getElementById("chat-box");

  if (chatBox) {
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
            <div id="message-${data.message_id}" class="message-div">
              <p class="message-p message-me">${data.message}</p> 
              <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/chats/${data.chat_id}/messages/${data.message_id}" class="message-delete">
                <i class="fas fa-trash message-delete"></i>
              </a>
            </div>
            `;
          } else {
            chatBox.innerHTML += `
            <div id="message-${data.message_id}" class="message-div">
              <p class="message-p message-them">${data.message}</p> 

              <a class="message-username" href="/users/${data.author_id}">${data.username}</a>
            </div>
            `;
          }
        } else if (data.action === "destroy") {
          document.getElementById(`message-${data.message_id}`).remove();
        }
      }
    });
  }
});