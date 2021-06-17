class ApplicationController < ActionController::Base
  helper_method :friend_list, :is_friend?, :request_pending?, :response_pending?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def friend_list(user)
    user.friend_as + user.friend_bs
  end

  def is_friend?(user_a, user_b)
    is_friends1 = Friendship.find_by(user_a: user_a.id, user_b: user_b.id)
    is_friends2 = Friendship.find_by(user_a: user_b.id, user_b: user_a.id)

    is_friends1.nil? && is_friends2.nil? ? false : true
  end

  def request_pending?(curr_user, receiver)
    fr = FriendRequest.find_by(requestor_id: curr_user.id, receiver_id: receiver.id)

    fr.nil? ? false : true
  end

  def response_pending?(curr_user, requestor)
    fr = FriendRequest.find_by(requestor_id: requestor.id, receiver_id: curr_user.id)

    fr.nil? ? false : true
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :bio])
  end
end
