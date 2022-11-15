import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="books"
export default class extends Controller {
  connect() {
  }

  delete(event){
    let confirmed = confirm("Are you sure")

    if(!confirmed){
      event.preventDefault()
    }
  }
}
