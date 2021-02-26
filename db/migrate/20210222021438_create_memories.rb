class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string     :title,    null: false
      t.text       :diary,    null: false
      t.date       :memory,   null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
