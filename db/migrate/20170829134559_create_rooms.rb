class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|

      t.string :name, default: '新規チャット'
      t.text :explain, default: '説明を入力してください'

      t.timestamps
    end
  end
end
