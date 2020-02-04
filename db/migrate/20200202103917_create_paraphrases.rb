class CreateParaphrases < ActiveRecord::Migration[5.2]
  def change
    create_table :paraphrases do |t|
      t.string :answer, null: false, unique: true, index: true
      t.integer :theme_id, foreign_key: true, null: false
      t.integer :user_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
