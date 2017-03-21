class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.boolean :read , default: false
      t.references :chat, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
