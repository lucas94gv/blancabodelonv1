class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancestry
      t.integer :code
      t.integer :position

      t.timestamps
    end
  end
end
