import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-active"
export default class extends Controller {
  connect() {
    this.element.setAttribute("data-action", "click->search-active#clicked")
  }

  clicked() {
    let links = document.querySelectorAll("#results a.active")
    Array.from(links).forEach(link => {
      link.classList.remove("active")
    })

    this.element.classList.add("active")
  }
}
