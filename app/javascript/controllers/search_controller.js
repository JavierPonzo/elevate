import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    //console.log(this.inputTarget)
    //console.log(this.listTarget)
  }

  suggestions() {
    const query = this.inputTarget.value
    const url = `/posts/search_suggestions?query=${query}`
    fetch(url,
     { headers: {
        "Accept": "application/json"
      }}
    )
    .then(response=>response.json())
    .then(data=>this.updateList(data))
  }

  updateList(suggestions) {
    this.listTarget.innerHTML=""

    suggestions.forEach((suggestion) => {
      const li = `<li>${suggestion}</li>`
      this.listTarget.insertAdjacentHTML("beforeend", li)
    })
  }

}
