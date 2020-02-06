class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id, foreign_key: true, null: false
      t.integer :paraphrase_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
