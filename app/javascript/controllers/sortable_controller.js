import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'

export default class extends Controller {
	static targets = ['sortable']

	connect() {
		new Sortable(this.sortableTarget, {
			group: this.sortableTarget.dataset.name,
			animation: 300,
			preventOnFilter: true,
			onEnd: this.saveKanbanBoard.bind(this)
		})
	}

	saveKanbanBoard(event) {
		Rails.ajax({
			url: event.item.dataset.url,
			type: 'put',
			data: this.formData
		})
	}
}
