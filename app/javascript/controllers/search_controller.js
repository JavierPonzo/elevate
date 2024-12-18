import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    // Esto se ejecuta cuando el controlador se conecta
  }

  suggestions() {
    const query = this.inputTarget.value
    const url = `/posts/search_suggestions?query=${query}`

    if (query.length < 2) {
      this.listTarget.innerHTML = ''
      this.listTarget.style.display = 'none'
      return
    }

    fetch(url, {
      headers: {
        "Accept": "application/json"
      }
    })
    .then(response => response.json())
    .then(data => this.updateList(data))
  }

  updateList(suggestions) {
    this.listTarget.innerHTML = ""
    if (suggestions.length === 0) {
      this.listTarget.style.display = 'none'
    } else {
      suggestions.forEach((suggestion) => {
        const li = `<li class="list-group-item"><a href="/posts/${(suggestion.id)}">${suggestion.title}</a></li>`
        console.log(suggestion)
        this.listTarget.insertAdjacentHTML("beforeend", li)
      })
      this.listTarget.style.display = 'block'
    }
  }
}
