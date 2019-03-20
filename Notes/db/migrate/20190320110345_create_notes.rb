class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.string :image
      t.string :title

      t.timestamps null: false
    end
  end
end
