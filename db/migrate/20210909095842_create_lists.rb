class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.belongs_to :board, index: true
      t.string :title, null: false
      t.integer :position, index: true
      t.timestamps

      t.index [:position, :board_id], unique: true
    end
  end
end
