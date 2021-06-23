import consumer from "./consumer"

consumer.subscriptions.create({channel: "ChatChannel", chat_id: 1}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("CONNECTED...");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("DATA", data);
    const chatBox = document.getElementById("chat-box");

    chatBox.innerHTML += `
    <p>${data.message} by: someone Delete</p>
    `
  }
});
