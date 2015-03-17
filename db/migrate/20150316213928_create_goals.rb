class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.string :completion, null: false
      t.integer :commentable_id, index: true

      t.timestamps null: false
    end
  end
end
