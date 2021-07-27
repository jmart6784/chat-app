const userEdit = () => {

  // Hide/Show change password fields
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

  // Delete user show/hide links
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

}

export default userEdit;