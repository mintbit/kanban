import Sortable from './sortable_controller'

export default class extends Sortable {

	saveKanbanBoard(event) {
		this.formData = new FormData();
		this.formData.append('list[position]', event.newDraggableIndex)
		super.saveKanbanBoard(event)
	}
}
