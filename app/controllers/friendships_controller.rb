class FriendshipsController < ApplicationController
  include ApplicationHelper

  def friends
    user = User.find(params[:id])
    @friends = friend_list(user)
  end

  def ajax_friendship
    @user_a = User.find(params[:user_a])
    @user_b = User.find(params[:user_b])

    @friendship = Friendship.find_by(user_a: @user_a.id, user_b: @user_b.id)
    friend_request = FriendRequest.find_by(requestor_id: @user_b.id, receiver_id: @user_a.id)

    if @friendship.nil?
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
end
