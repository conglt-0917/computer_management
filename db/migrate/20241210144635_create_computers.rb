class CreateComputers < ActiveRecord::Migration[7.0]
  def change
    create_table :computers do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
