require 'rails_helper'

RSpec.describe "Friendships", type: :request do
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

  let(:valid_accept_params) do
    params = {
      id: 0,  
      user_a: user_1.id, 
      user_b: user_2.id,
      choice: "Accept",
      parent_div: "friendship-div-#{user_2.id}", 
      format: :js
    }
  end

  describe "GET /index" do
    it "gets friend list if authenticated" do
      sign_out(user_1)
      sign_in(user_1)
      get friends_path(id: user_1.id)
      expect(response).to render_template(:friends) 
    end

    it "if not authenticated redirect to sign in page" do
      sign_out(user_1)
      get friends_path(id: user_1.id)
      expect(response).to redirect_to(new_user_session_path)
    end

    it "Fails to get friends list if ID param is missing" do
      sign_out(user_1)
      sign_in(user_1)
      expect {get friends_path(id: nil)}.to raise_error(ActionController::UrlGenerationError)
    end
  end

  describe "PUT /ajax_friend_request" do
    it "Creates friendship given two users" do
      sign_out(user_1)
      sign_in(user_1)
      put ajax_friendship_friendship_path(valid_accept_params)
      fs = Friendship.find_by(user_a: user_1.id, user_b: user_2.id)
      expect(fs.nil?).to eql(false)
    end

    it "Doesn't create friendship when two users are the same" do
      params = {
        id: 0,  
        user_a: user_1.id, 
        user_b: user_1.id,
        choice: "Accept",
        parent_div: "friendship-div-#{user_1.id}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      put ajax_friendship_friendship_path(params)
      fs = Friendship.find_by(user_a: user_1.id, user_b: user_1.id)
      expect(fs.nil?).to eql(true)
    end

    it "Doesn't create friendship when user_a is nil" do
      params = {
        id: 0,  
        user_a: nil, 
        user_b: user_2.id,
        choice: "Accept",
        parent_div: "friendship-div-#{user_2.id}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      expect {put ajax_friendship_friendship_path(params)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "Doesn't create friendship when user_b is nil" do
      params = {
        id: 0,  
        user_a: user_1.id, 
        user_b: nil,
        choice: "Accept",
        parent_div: "friendship-div-#{nil}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      expect {put ajax_friendship_friendship_path(params)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "Doesn't create friendship when choice param is nil" do
      params = {
        id: 0,  
        user_a: user_1.id, 
        user_b: user_2.id,
        choice: nil,
        parent_div: "friendship-div-#{user_2.id}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      before_count = Friendship.all.count
      put ajax_friendship_friendship_path(params)
      after_count = Friendship.all.count
      expect(before_count).to eql(after_count)
    end

    it "Doesn't create friendship when parent_div param is nil" do
      params = {
        id: 0,  
        user_a: user_1.id, 
        user_b: user_2.id,
        choice: "Accept",
        parent_div: nil, 
        format: :js
      }
      fs = Friendship.find_by(user_a: user_1.id, user_b: user_2.id)
      fs.destroy unless fs.nil?
      sign_out(user_1)
      sign_in(user_1)
      before_count = Friendship.all.count
      put ajax_friendship_friendship_path(params)
      after_count = Friendship.all.count
      expect(before_count).to eql(after_count)
    end

    it "Doesn't create friendship when id param is nil" do
      params = {
        id: nil,  
        user_a: user_1.id, 
        user_b: user_2.id,
        choice: "Accept",
        parent_div: "friendship-div-#{user_2.id}", 
        format: :js
      }
      sign_out(user_1)
      sign_in(user_1)
      expect {put ajax_friendship_friendship_path(params)}.to raise_error(ActionController::UrlGenerationError)
    end

    it "Doesn't create friendship if the same one already exists" do
      params = {
        id: 0,  
        user_a: user_1.id, 
        user_b: user_2.id,
        choice: "Accept",
        parent_div: "friendship-div-#{user_2.id}", 
        format: :js
      }
      fs = Friendship.find_by(user_a: user_1.id, user_b: user_2.id)

      fs = Friendship.create(user_a: user_1.id, user_b: user_2.id) if fs.nil?

      sign_out(user_1)
      sign_in(user_1)
      before_count = Friendship.all.count
      put ajax_friendship_friendship_path(params)
      after_count = Friendship.all.count
      expect(before_count).to eql(after_count)
    end

    it "Doesn't Create Friendship if friend request doesn't exist" do
      existing_request = FriendRequest.find_by(requestor_id: user_1.id, receiver_id: user_2.id)

      if existing_request.nil?
        existing_request = FriendRequest.create(requestor_id: user_1.id, receiver_id: user_2.id)
      end
      existing_request.destroy

      sign_out(user_1)
      sign_in(user_1)
      before_count = Friendship.all.count
      put ajax_friendship_friendship_path(valid_accept_params)
      after_count = Friendship.all.count
      expect(before_count).to eql(after_count)
    end
  end

  describe "DELETE /ajax_friendship_destroy" do
    it "Deletes a friendship the current user is involved with" do
      friendship1 = Friendship.find_by(user_a: user_1.id, user_b: user_2.id)
      friendship2 = Friendship.find_by(user_a: user_2.id, user_b: user_1.id)

      if friendship1.nil?
        friendship1 = Friendship.create(user_a: user_1.id, user_b: user_2.id)
      end
      
      friendship2.destroy unless friendship2.nil?

      sign_out(user_1)
      sign_in(user_1)
      params = {
        id: user_2.id,  
        html_id: "unfriend-#{user_2.id}", 
        format: :js
      }
      delete ajax_friendship_destroy_friendship_path(params)
      expect(Friendship.find_by(user_a: user_1.id, user_b: user_2.id).nil?).to eql(true)
    end
  end
end
