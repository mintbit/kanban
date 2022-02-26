import { Controller } from '@hotwired/stimulus'
import Rails from '@rails/ujs'

export default class extends Controller {
	static targets = [
		'addNew',
		'formContainer',
		'title',
		'form',
		'titleInput',
		'viewComponent',
		'formComponent',
	]

	connect() {
		this.terminateForm()
	}

	submit() {
		Rails.fire(this.formTarget, 'submit')
	}

	toggleForm() {
		this.titleTarget.value = ''
		this.addNewTarget.hidden = !this.addNewTarget.hidden
		this.formContainerTarget.hidden = !this.formContainerTarget.hidden
	}

	update() {
		this.submit()
		this.toggleTitle()
	}

	toggleTitle() {
		this.titleTarget.hidden = !this.titleTarget.hidden
		this.titleInputTarget.hidden = !this.titleInputTarget.hidden
		this.titleInputTarget.focus()
	}

	terminateForm() {
		if (this.hasFormComponentTarget) {
			this.formComponentTarget.addEventListener("keyup", (event) => {
				if (event.key === 'Enter') {
					event.currentTarget.blur()
				}
			})

			document.addEventListener('keyup', (event) => {
				event = event || window.event
				if (event.key == 'Escape' || event.key == 'Esc') {
					if (this.hasViewComponentTarget && this.formComponentTarget) {
						this.viewComponentTarget.hidden = false
						this.formComponentTarget.hidden = true
						document.activeElement.blur()
					}
				}
			})
		}
	}
}
