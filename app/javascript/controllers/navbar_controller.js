// app/javascript/controllers/navbar_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["navbar"];

  connect() {
    // Add scroll event listener
    window.addEventListener("scroll", this.handleScroll.bind(this));
    console.log("Navbar controller connected");
  }

  disconnect() {
    // Clean up event listener when the controller is disconnected
    window.removeEventListener("scroll", this.handleScroll.bind(this));
  }

  handleScroll() {
    const navbar = this.element; // Use the element this controller is attached to
    if (window.scrollY > 50) {
      navbar.classList.add("navbar-scrolled");
    } else {
      navbar.classList.remove("navbar-scrolled");
    }
  }
}
