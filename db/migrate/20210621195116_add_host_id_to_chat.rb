class AddHostIdToChat < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :host_id, :integer
  end
end
