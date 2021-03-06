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

  let(:valid_params) do
    params = {
      id: 0,  
      requestor_id: user_1.id, 
      receiver_id: user_2.id, 
      html_id: "request-#{user_2.id}", 
      format: :js
    }
  end

  describe "GET /index" do
    it "gets index page" do
      sign_out(user_1)
      sign_in(user_1)
      get friend_requests_path
      expect(response).to render_template(:index)
    end

    it "Redirect to sign in page if not signed in" do
      sign_out(user_1)
      get friend_requests_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "PUT /ajax_friend_request" do
    it "Creates friend request given two users" do
      sign_out(user_1)
      sign_in(user_1)
      put ajax_friend_request_friend_request_path(valid_params)
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

    it "Doesn't create another friend request if one already exists" do
      sign_out(user_1)
      sign_in(user_1)
      before_count = FriendRequest.all.count
      put ajax_friend_request_friend_request_path(valid_params)
      after_count = FriendRequest.all.count
      expect(before_count).to eql(after_count)
    end

    it "Doesn't create friend request if friendship already exists" do
      existing_friendship = Friendship.find_by(user_a: user_1.id, user_b: user_2.id)

      Friendship.create(user_a: user_1.id, user_b: user_2.id) if existing_friendship.nil?

      sign_out(user_1)
      sign_in(user_1)
      before_count = FriendRequest.all.count
      put ajax_friend_request_friend_request_path(valid_params)
      after_count = FriendRequest.all.count
      expect(before_count).to eql(after_count)
    end
  end
end
