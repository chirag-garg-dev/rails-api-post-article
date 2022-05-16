class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string "name"
      t.string "title"
      t.string "description"
      t.string "avatar"
      t.timestamps
    end
  end
end
