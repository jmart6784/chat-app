const nav = () => {
  // Nav drop down
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
}

export default nav;