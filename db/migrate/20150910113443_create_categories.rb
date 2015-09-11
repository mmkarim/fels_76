class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :info

      t.timestamps null: false
    end
  end
end
