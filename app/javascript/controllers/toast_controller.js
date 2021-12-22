import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.classList.add("fadein");
    this.element.classList.add("show");
    this.element.classList.remove("hide");

    function delay(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }
    delay(this.element.dataset.bsDelay).then(() => {
      this.element.classList.add("hide");
      this.element.classList.remove("show");
    });
  }
}
