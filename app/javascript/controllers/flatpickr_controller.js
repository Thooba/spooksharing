import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "reservation_start", "reservation_end" ]
  connect() {
    flatpickr(this.reservation_startTarget, {defaultDate: "today"})
    flatpickr(this.reservation_endTarget, {defaultDate: "today"})
  }
}
