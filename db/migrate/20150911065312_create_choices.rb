class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :content
      t.boolean :correct
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
