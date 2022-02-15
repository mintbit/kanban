// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'controllers'

Rails.start()
ActiveStorage.start()

// Bootstrap
require("@popperjs/core")
import Bootstrap from 'bootstrap/dist/js/bootstrap.min.js'

window.bootstrap = Bootstrap

require("bootstrap")
require('bootstrap-icons/font/bootstrap-icons.css')
import "../stylesheets/application"

window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js')
document.addEventListener("turbo:load", function() {
	var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
	var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
		return new bootstrap.Popover(popoverTriggerEl)
	})

	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	})
});
