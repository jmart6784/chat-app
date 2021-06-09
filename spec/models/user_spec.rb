require 'rails_helper'

RSpec.describe User, type: :model do

  current_user = User.find_by(email: "rspec@example.com")

  if current_user.nil?
    current_user = User.create(
      email: "rspec@example.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end

  it "User has an email" do
    current_user.email = ""

    expect(current_user).to_not be_valid
  end
end
