// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

require("@fortawesome/fontawesome-free");

document.addEventListener('turbolinks:load', () => {
  const navPic = document.getElementById("nav-pic");
  const dropContent = document.getElementById("nav-drop-content");

  navPic.addEventListener("click", () => {
    dropContent.style.display = "block";
  });

  document.addEventListener("click", (e) => {
    if (e.target.id != "nav-pic") {
      dropContent.style.display = "none";
    }
  });
});

// New chat field validations
document.addEventListener('turbolinks:load', () => {
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
});

// Hide/Show change password fields
document.addEventListener('turbolinks:load', () => {
  const passwordBtn = document.getElementById("change-password-btn");
  const passField1 = document.getElementById("edit-user-password-1");
  const passField2 = document.getElementById("edit-user-password-2");

  passField1.style.display = "none";
  passField2.style.display = "none"; 

  if (passwordBtn) {
    passwordBtn.addEventListener("click", () => {
      if (passField1.style.display === "flex") {
        passField1.style.display = "none";
        passField2.style.display = "none";
        passwordBtn.textContent = "Change Password";
      } else if (passField1.style.display === "none") {
        passField1.style.display = "flex";
        passField2.style.display = "flex"; 
        passwordBtn.textContent = "Hide Fields";
      }
    });
  }
});

// Delete user show/hide links
document.addEventListener('turbolinks:load', () => {
  const deleteBtn = document.getElementById("delete-account-btn");
  const optionsDiv = document.getElementById("user-delete-options-div");
  const cancelBtn = document.getElementById("user-edit-cancel-btn");

  if (deleteBtn) {
    optionsDiv.style.display = "none";

    deleteBtn.addEventListener("click", () => {
      if (optionsDiv.style.display === "none") {
        optionsDiv.style.display = "flex";
      } else {
        optionsDiv.style.display = "none";
      }
    });

    cancelBtn.addEventListener("click", () => {
      if (optionsDiv.style.display === "none") {
        optionsDiv.style.display = "flex";
      } else {
        optionsDiv.style.display = "none";
      }
    });
  }
});

// Username input field validations
document.addEventListener('turbolinks:load', () => {
  const usernameField = document.getElementById("username-field");
  const usernameValidLength = document.getElementById("username-valid-txt-1");
  const usernameValidFormat = document.getElementById("username-valid-txt-2");

  if (usernameField) {
    usernameValidLength.style.display = "none";
    usernameValidFormat.style.display = "none";

    usernameField.addEventListener("input", () => {
      usernameValidLength.style.display = "block";
      usernameValidFormat.style.display = "block";

      if (usernameField.value.length >= 4 && usernameField.value.length <= 16) {
        usernameValidLength.textContent = `must be 4-16 characters (${usernameField.value.length})`;
        usernameValidLength.style.color = "green";
      } else {
        usernameValidLength.textContent = `username must be 4-16 characters long, currently (${usernameField.value.length})`
        usernameValidLength.style.color = "red";
      }

      if (/^[a-zA-Z0-9]+$/.test(usernameField.value)) {
        usernameValidFormat.style.color = "green";
      } else {
        usernameValidFormat.style.color = "red";
      }
    });
  }
});

// email input field validations
document.addEventListener('turbolinks:load', () => {
  const emailField = document.getElementById("email-field");
  const emailValidFormat = document.getElementById("email-valid-txt-1");
  const emailLength = document.getElementById("email-valid-txt-2");

  if (emailField) {
    emailLength.style.display = "none";
    emailValidFormat.style.display = "none";

    emailField.addEventListener("input", () => {
      emailLength.style.display = "block";
      emailValidFormat.style.display = "block";

      if (emailField.value.length === 0) {
        emailLength.style.color = "red";
      } else {
        emailLength.style.color = "green";
      }

      if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailField.value)) {
        emailValidFormat.style.color = "green";
      } else {
        emailValidFormat.style.color = "red";
      }
    });
  }
});