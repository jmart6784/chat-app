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

import chatShow from "./chats/chatShow";
import formValidations from "./general_forms/formValidations";
import userEdit from "./devise/userEdit";

document.addEventListener('turbolinks:load', () => {
  chatShow();
  formValidations();
  userEdit();
});

// Nav drop down
document.addEventListener('turbolinks:load', () => {
  const navPic = document.getElementById("nav-pic");
  const dropContent = document.getElementById("nav-drop-content");

  if (navPic) {
    navPic.addEventListener("click", () => {
      dropContent.style.display = "block";
    });
  
    document.addEventListener("click", (e) => {
      if (e.target.id != "nav-pic") {
        dropContent.style.display = "none";
      }
    });
  }
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

// Remove field with errors div
document.addEventListener("turbolinks:load", () => {
  let errorDivs = document.querySelectorAll(".field_with_errors");

  if (errorDivs[0]) {
    for (let i = 0; i < errorDivs.length; i++) {
      const errorDiv = errorDivs[i];
      errorDiv.outerHTML = errorDiv.innerHTML;
    }
  }
});

// Hide flash messages after 4 seconds
document.addEventListener("turbolinks:load", () => {
  let notice = document.getElementById("notice");
  let alert = document.getElementById("alert");

  if (notice) {
    if (notice.textContent === "") {
      notice.style.display = "none";
    }

    setTimeout(() => {
      notice.style.display = "none";
    }, 4000);
  }

  if (alert) {
    if (alert.textContent === "") {
      alert.style.display = "none";
    }

    setTimeout(() => {
      alert.style.display = "none";
    }, 4000);
  }
});