
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textarea"]

  connect() {
    console.log("Form controller connected")
  }

  clearForm() {
    this.textareaTarget.value = ""
  }
}