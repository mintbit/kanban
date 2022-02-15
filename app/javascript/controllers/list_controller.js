import Sortable from './sortable_controller'

export default class extends Sortable {

	saveKanbanBoard(event) {
		this.formData = new FormData();
		this.formData.append('card[list_id]', event.to.dataset.listId)
		this.formData.append('card[position]', event.newDraggableIndex)
		this.formData.append('card[previous_list_id]', event.from.dataset.listId)
		super.saveKanbanBoard(event)
	}
}
