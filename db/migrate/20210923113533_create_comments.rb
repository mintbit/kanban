class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :card, index: true
      t.string :description
      t.timestamps
    end
  end
end
