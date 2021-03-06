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
import newChat from "./chats/newChat";
import nav from "./layouts/nav";

document.addEventListener('turbolinks:load', () => {
  chatShow();
  formValidations();
  userEdit();
  newChat();
  nav();
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

  if (notice && alert) {
    if (notice.textContent === "") {
      notice.style.display = "none";
    }

    if (alert.textContent === "") {
      alert.style.display = "none";
    }

    setTimeout(() => {
      notice.style.display = "none";
    }, 4000);

    setTimeout(() => {
      alert.style.display = "none";
    }, 4000);
  }
});