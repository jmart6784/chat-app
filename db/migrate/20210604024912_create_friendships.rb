class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :user_a
      t.integer :user_b

      t.timestamps
    end
  end
end
