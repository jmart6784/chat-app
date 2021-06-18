class FriendshipsController < ApplicationController

  def friends
    user = User.find(params[:id])
    @friends = friend_list(user)
  end

  def ajax_friendship
    @user_a = User.find(params[:user_a])
    @user_b = User.find(params[:user_b])

    return unless @user_a === current_user

    @friendship = Friendship.find_by(user_a: @user_a.id, user_b: @user_b.id)
    friend_request = FriendRequest.find_by(requestor_id: @user_b.id, receiver_id: @user_a.id)

    if @friendship.nil? && current_user.requests_as_receiver.include?(friend_request) && @user_a != @user_b
      if params[:choice] === "Accept"
        fr = Friendship.new(user_a: @user_a.id, user_b: @user_b.id)

        friend_request.destroy if fr.save
      else
        friend_request.destroy
      end
    end

    respond_to do |format|
      format.js {}
    end
  end

  def ajax_friendship_destroy
    user = User.find(params[:id])
    friendship1 = Friendship.find_by(
      user_a: current_user.id,
      user_b: user.id
    )

    friendship2 = Friendship.find_by(
      user_a: user.id,
      user_b: current_user.id
    )

    friendship1.destroy unless friendship1.nil?
    friendship2.destroy unless friendship2.nil?

    respond_to do |format|
      format.js {}
    end
  end
end
