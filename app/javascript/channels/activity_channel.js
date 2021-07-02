import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    this.perform("appear");
    console.log("connected to activity channel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data);
    let statusDots = document.getElementsByClassName(`user-${data.user_id}-status`);

    for (let i = 0; i < statusDots.length; i++) {
      let element = statusDots[i];
      if (data.status === "online") {
        element.classList.add("online");
      } else {
        element.classList.remove("online");
      }
    }
  }
});
