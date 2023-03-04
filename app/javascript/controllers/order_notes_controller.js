import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="order-notes"
export default class extends Controller {
  connect() {
  }
  title_order(e){
    e.preventDefault()
    console.log('title order')
    console.log(e.target)
  }

  date_order(e){
    e.preventDefault()
    console.log('date order')
    console.log(e.target)

  }
}
