class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|

      t.string      :name
      t.integer     :position
      # table name should be in plural 
      t.references  :parent, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
