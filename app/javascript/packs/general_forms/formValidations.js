const formValidations = () => {

  // Username input field validations
  const usernameField = document.getElementById("username-field");
  const usernameValidLength = document.getElementById("username-valid-txt-1");
  const usernameValidFormat = document.getElementById("username-valid-txt-2");

  if (usernameField) {
    usernameValidLength.style.display = "none";
    usernameValidFormat.style.display = "none";

    usernameField.addEventListener("input", () => {
      usernameValidLength.style.display = "block";
      usernameValidFormat.style.display = "block";
      usernameValidLength.textContent = `must be 4-16 characters (${usernameField.value.length})`;

      if (usernameField.value.length >= 4 && usernameField.value.length <= 16) {
        usernameValidLength.style.color = "green";
      } else {
        usernameValidLength.style.color = "red";
      }

      if (/^[a-zA-Z0-9]+$/.test(usernameField.value)) {
        usernameValidFormat.style.color = "green";
      } else {
        usernameValidFormat.style.color = "red";
      }
    });
  }

  // email input field validations
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

  // firstname input field validations
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

  // lastname input field validations
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

  // Bio input field validations
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

  // Password field validations
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

  // Confirm Password field validations
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

  // matching passwords validations
  const match1 = document.getElementById("password-field");
  const match2 = document.getElementById("con-password-field");

  const passMatch1 = document.getElementById("password-valid-txt-2");
  const passMatch2 = document.getElementById("con-password-valid-txt-2");

  if (match1 && match2 && passMatch1 && passMatch2) {
    passMatch1.style.display = "none";
    passMatch2.style.display = "none";

    const comparePasswords = () => {
      passMatch1.style.display = "block";
      passMatch2.style.display = "block";
  
      if (match1.value === match2.value) {
        passMatch1.style.color = "green";
        passMatch2.style.color = "green";
      } else {
        passMatch1.style.color = "red";
        passMatch2.style.color = "red";
      }
    };

    match1.addEventListener("input", comparePasswords);
    match2.addEventListener("input", comparePasswords);
  }

}

export default formValidations;