class CreateOnlineStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :online_statuses do |t|
      t.text :status
      t.integer :user_id

      t.timestamps
    end
  end
end
