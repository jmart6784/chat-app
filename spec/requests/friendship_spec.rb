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
end
