class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id, null: false, index: true
      t.text :commentable_type, null: false
      t.integer :author_id, null: false, index: true
      t.string :message, null: false

      t.timestamps null: false
    end
  end
end
