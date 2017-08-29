class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|

      t.text :content, null: false
      t.integer :user_id, unsigned: true, null: false
      t.integer :receiver, unsigned: true, null: false

      t.timestamps
    end
  end
end
