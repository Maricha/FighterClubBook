class CreateRels < ActiveRecord::Migration
  def change
    create_table :rels do |t|
        t.integer :book_id
        t.integer :skill_id

      t.timestamps null: false
    end
  end
end
