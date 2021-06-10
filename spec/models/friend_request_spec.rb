require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  user_1 = User.find_by(email: "rspec@example.com")
  user_2 = User.find_by(email: "rspec2@example.com")

  if user_1.nil?
    user_1 = User.creaet!(
      email: "rspec@example.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end

  if user_2.nil?
    user_2 = User.create!(
      email: "rspec2@example.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end

  friend_request = FriendRequest.create(
    requestor_id: user_1.id,
    receiver_id: user_2.id
  )

  it "Friend Request has a requestor_id" do
    friend_request.requestor_id = nil
    expect(friend_request).to_not be_valid
  end
end
