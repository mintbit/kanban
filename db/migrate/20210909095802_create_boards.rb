class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :title, default: 'Untitled'
      t.timestamps
    end
  end
end
