class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :question, null: false, unique: true, index: true
      t.integer :paraphrase_id, foreign_key: true, null: true
      t.integer :user_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
