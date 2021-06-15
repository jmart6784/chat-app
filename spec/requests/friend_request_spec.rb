require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do
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

  friend_request = FriendRequest.create(
    requestor_id: user_1.id,
    receiver_id: user_2.id
  )

  describe "PUT /ajax_friend_request" do
    it "Creates friend request given two users" do
      params = {
        id: 0,  
        requestor_id: user_1.id, 
        receiver_id: user_2.id, 
        html_id: "request-#{user_2.id}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      put ajax_friend_request_friend_request_path(params)
      fr = FriendRequest.find_by(requestor_id: user_1.id, receiver_id: user_2.id)
      expect(fr.nil?).to eql(false)
    end

    it "Doesn't create friend request when two users are the same" do
      params = {
        id: 0,  
        requestor_id: user_1.id, 
        receiver_id: user_1.id, 
        html_id: "request-#{user_1.id}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      put ajax_friend_request_friend_request_path(params)
      fr = FriendRequest.find_by(requestor_id: user_1.id, receiver_id: user_1.id)
      expect(fr.nil?).to eql(true)
    end
  end
end
