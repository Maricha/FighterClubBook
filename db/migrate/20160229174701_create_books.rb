class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :fname
      t.string :sname
      t.text :desc

      t.timestamps null: false
    end
  end
end
