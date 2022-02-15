class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :card, index: true
      t.string :description
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
