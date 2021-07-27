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

// Hide/Show change password fields
document.addEventListener('turbolinks:load', () => {
  const passwordBtn = document.getElementById("change-password-btn");
  const passField1 = document.getElementById("edit-user-password-1");
  const passField2 = document.getElementById("edit-user-password-2");

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

// firstname input field validations
document.addEventListener('turbolinks:load', () => {
  const firstnameField = document.getElementById("firstname-field");
  const firstnameLength = document.getElementById("firstname-valid-txt-1");

  if (firstnameField) {
    firstnameLength.style.display = "none";

    firstnameField.addEventListener("input", () => {
      firstnameLength.style.display = "block";
      firstnameLength.textContent = `name must be between 1-60 characters long (${firstnameField.value.length})`;

      if (firstnameField.value.length >= 1 &&  firstnameField.value.length <= 60) {
        firstnameLength.style.color = "green";
      } else {
        firstnameLength.style.color = "red";
      }
    }); 
  }
});

// lastname input field validations
document.addEventListener('turbolinks:load', () => {
  const lastnameField = document.getElementById("lastname-field");
  const lastnameLength = document.getElementById("lastname-valid-txt-1");

  if (lastnameField) {
    lastnameLength.style.display = "none";

    lastnameField.addEventListener("input", () => {
      lastnameLength.style.display = "block";
      lastnameLength.textContent = `name must be between 1-60 characters long (${lastnameField.value.length})`;

      if (lastnameField.value.length >= 1 &&  lastnameField.value.length <= 60) {
        lastnameLength.style.color = "green";
      } else {
        lastnameLength.style.color = "red";
      }
    }); 
  }
});

// Bio input field validations
document.addEventListener('turbolinks:load', () => {
  const bioField = document.getElementById("bio-field");
  const bioLength = document.getElementById("bio-valid-txt-1");

  if (bioField) {
    bioLength.style.display = "none";

    bioField.addEventListener("input", () => {
      bioLength.style.display = "block";
      bioLength.textContent = `character limit is 150 (${bioField.value.length})`;

      if (bioField.value.length <= 150) {
        bioLength.style.color = "green";
      } else {
        bioLength.style.color = "red";
      }
    });
  }
});

// Password field validations
document.addEventListener("turbolinks:load", () => {
  const passwordField = document.getElementById("password-field");
  const passwordLength = document.getElementById("password-valid-txt-1");

  if (passwordField) {
    passwordLength.style.display = "none";
    
    passwordField.addEventListener("input", () => {
      passwordLength.style.display = "block";
      passwordLength.textContent = `must be between 6-128 characters (${passwordField.value.length})`;

      if (passwordField.value.length >= 6 && passwordField.value.length <= 128) {
        passwordLength.style.color = "green";
      } else {
        passwordLength.style.color = "red";
      }
    });
  }
});


// Password field validations
document.addEventListener("turbolinks:load", () => {
  const passwordField = document.getElementById("password-field");
  const passwordLength = document.getElementById("password-valid-txt-1");

  if (passwordField) {
    passwordLength.style.display = "none";
    
    passwordField.addEventListener("input", () => {
      passwordLength.style.display = "block";
      passwordLength.textContent = `must be between 6-128 characters (${passwordField.value.length})`;

      if (passwordField.value.length >= 6 && passwordField.value.length <= 128) {
        passwordLength.style.color = "green";
      } else {
        passwordLength.style.color = "red";
      }
    });
  }
});

// Confirm Password field validations
document.addEventListener("turbolinks:load", () => {
  const conPasswordField = document.getElementById("con-password-field");
  const conPasswordLength = document.getElementById("con-password-valid-txt-1");

  if (conPasswordField) {
    conPasswordLength.style.display = "none";
    
    conPasswordField.addEventListener("input", () => {
      conPasswordLength.style.display = "block";
      conPasswordLength.textContent = `must be between 6-128 characters (${conPasswordField.value.length})`;

      if (conPasswordField.value.length >= 6 && conPasswordField.value.length <= 128) {
        conPasswordLength.style.color = "green";
      } else {
        conPasswordLength.style.color = "red";
      }
    });
  }
});

// matching passwords validations
document.addEventListener("turbolinks:load", () => {
  const passwordField = document.getElementById("password-field");
  const conPasswordField = document.getElementById("con-password-field");

  const passMatch1 = document.getElementById("password-valid-txt-2");
  const passMatch2 = document.getElementById("con-password-valid-txt-2");

  if (passwordField && conPasswordField && passMatch1 && passMatch2) {
    passMatch1.style.display = "none";
    passMatch2.style.display = "none";

    const comparePasswords = () => {
      passMatch1.style.display = "block";
      passMatch2.style.display = "block";
  
      if (passwordField.value === conPasswordField.value) {
        passMatch1.style.color = "green";
        passMatch2.style.color = "green";
      } else {
        passMatch1.style.color = "red";
        passMatch2.style.color = "red";
      }
    };

    passwordField.addEventListener("input", comparePasswords);
    conPasswordField.addEventListener("input", comparePasswords);
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

// Chat show view hide/show guests
document.addEventListener("turbolinks:load", () => {
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
});

// Chat show view hide/show options
document.addEventListener("turbolinks:load", () => {
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
});

// Auto scroll to bottom of chat box
document.addEventListener("turbolinks:load", () => {
  const chatBox = document.getElementById("chat-box");
  if (chatBox) {
    chatBox.scrollTop = chatBox.scrollHeight;
  }
});

// Chat message character counter
document.addEventListener("turbolinks:load", () => {
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
});