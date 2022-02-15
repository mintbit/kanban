class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.belongs_to :list, index: true
      t.string :title, null: false
      t.string :description
      t.integer :position, index: true
      t.timestamps

      t.index [:position, :list_id], unique: true
    end
  end
end
