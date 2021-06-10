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
      login_as current_user
      get users_path
      expect(response).to render_template(:index)
    end
  end
end
