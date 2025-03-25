import { Controller } from "@hotwired/stimulus";
import { Dropdown } from "bootstrap";

export default class extends Controller {
  connect() {
    this.element.addEventListener("turbo:load", () => {
      this.initDropdowns();
    });
    this.initDropdowns();
  }

  initDropdowns() {
    document.querySelectorAll('[data-bs-toggle="dropdown"]').forEach(element => {
      new Dropdown(element);
    });
  }
}
