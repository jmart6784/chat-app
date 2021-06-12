require 'rails_helper'

RSpec.describe "Users", type: :request do

  current_user = User.find_by(email: "rspec@example.com")

  if current_user.nil?
    current_user = User.create(
      email: "rspec@example.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end

  describe "GET /index" do
    it "renders users index if signed in" do
      sign_in(current_user)
      get users_path
      expect(response).to render_template(:index)
    end

    it "redirect to sign in page if not authenticated" do
      sign_in(current_user)
      sign_out(current_user)
      get users_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /users/:id" do
    it "Retrieves user given the params[:id]" do
      sign_in(current_user)
      get "/users/#{current_user.id}"
      expect(response).to render_template(:show)
    end
  end
end
