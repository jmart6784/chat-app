class CreateJoinedChats < ActiveRecord::Migration[6.1]
  def change
    create_table :joined_chats do |t|
      t.integer :user_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
