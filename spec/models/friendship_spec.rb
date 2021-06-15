require 'rails_helper'

RSpec.describe Friendship, type: :model do
  user_1 = User.find_by(email: "rspec@example.com")
  user_2 = User.find_by(email: "rspec2@example.com")

  if user_1.nil?
    user_1 = User.create(
      email: "rspec@example.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end

  if user_2.nil?
    user_2 = User.create(
      email: "rspec2@example.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end

  friendship = Friendship.find_by(
    user_a: user_1.id,
    user_b: user_2.id
  )

  if friendship.nil?
    friendship = Friendship.create(
      user_a: user_1.id,
      user_b: user_2.id
    )
  end

  it "Friendship has a user_a ID" do
    friendship.user_a = nil
    expect(friendship).to_not be_valid
    friendship.user_a = user_1.id
  end

  it "Friendship has a user_b ID" do
    friendship.user_b = nil
    expect(friendship).to_not be_valid
    friendship.user_b = user_2.id
  end
end
