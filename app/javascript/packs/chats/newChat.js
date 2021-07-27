const newChat = () => {
  // New chat field validations
  const nameInput = document.getElementById("chat-name-input");
  const validationLabel = document.getElementById("new-chat-name-errors-length");
  const charCount = document.getElementById("new-chat-current-char");

  if (nameInput) {
    nameInput.addEventListener("input", () => {
      document.getElementById("new-chat-name-errors-length").style.display = "block";
      charCount.textContent = nameInput.value.length

      if (nameInput.value.length === 0 || nameInput.value.length > 30) {
        validationLabel.style.color = "red";
        charCount.style.color = "red";
      } else {
        validationLabel.style.color = "rgb(38, 207, 38)";
        charCount.style.color = "rgb(38, 207, 38)";
      }
    }); 
  }
}

export default newChat;