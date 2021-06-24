class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.integer :host_id
      t.integer :guest_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
