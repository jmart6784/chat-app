const chatShow = () => {

  // Chat show view hide/show guests
  const guestBtn = document.getElementById("chat-show-guests-btn");
  const guestDiv = document.getElementById("chat-show-guests-div");
  const closeBtn = document.getElementById("close-guest-div-btn");

  if (guestBtn) {
    guestDiv.style.display = "none";

    guestBtn.addEventListener("click", () => {
      if (guestDiv.style.display === "flex") {
        guestDiv.style.display = "none";
      } else if (guestDiv.style.display === "none") {
        guestDiv.style.display = "flex";
      }
    });

    closeBtn.addEventListener("click", () => {
      guestDiv.style.display = "none";
    });
  }

  // Auto scroll to bottom of chat box
  const chatBox = document.getElementById("chat-box");
  if (chatBox) {
    chatBox.lastElementChild.scrollIntoView();
  }

  // Chat message character counter
  const charCounter = document.getElementById("message-char-text");
  const messageInput = document.getElementById("message-input-field");

  if (messageInput) {
    messageInput.addEventListener("input", () => {
      if (messageInput.value.length <= 640) {
        charCounter.style.color = "white";
      } else {
        charCounter.style.color = "red";
        messageInput.value = messageInput.value.substring(0, messageInput.value.length - 1);
      }

      charCounter.textContent = `${messageInput.value.length}/640`;
    });
  }

  // Chat show view hide/show options
  const optionsBtn = document.getElementById("chat-show-options-btn");
  const optionsIcon = document.getElementById("options-dash");
  const optionsDiv = document.getElementById("host-options");

  if (optionsBtn) {
    optionsDiv.style.display = "none";

    const handleAppearance = () => {
      if (optionsDiv.style.display === "flex") {
        optionsDiv.style.display = "none";
      } else if (optionsDiv.style.display === "none") {
        optionsDiv.style.display = "flex";
      }
    };

    optionsIcon.addEventListener("click",  handleAppearance);
    optionsBtn.addEventListener("click", () => {
      setTimeout(() => {
        handleAppearance();
      }, 100);
    });

    document.addEventListener("click", (e) => {
      if (e.target != optionsBtn) {
        optionsDiv.style.display = "none";
      }
    });
  }

}

export default chatShow;