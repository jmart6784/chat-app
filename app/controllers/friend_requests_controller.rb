class FriendRequestsController < ApplicationController
  def index
    @requests = current_user.requests_as_receiver.paginate(page: params[:page], per_page: 21)
  end

  def ajax_friend_request
    @requestor = User.find(params[:requestor_id])
    @receiver = User.find(params[:receiver_id])

    existing_friendship1 = Friendship.find_by(user_a: @requestor.id, user_b: @receiver.id)
    existing_friendship2 = Friendship.find_by(user_a: @receiver.id, user_b: @requestor.id)

    return unless current_user === @requestor || current_user != @receiver || existing_friendship1.nil? || existing_friendship2.nil?

    existing_request = FriendRequest.find_by(requestor_id: @receiver.id, receiver_id: @requestor.id)

    if existing_request.nil?
      @friend_request = FriendRequest.find_by(requestor_id: @requestor.id, receiver_id: @receiver.id)

      unless @requestor === @receiver || !@friend_request.nil?
        @request_text = "Sent"
        FriendRequest.create(requestor_id: @requestor.id, receiver_id: @receiver.id)
      else
        @request_text = "Add"
      end
    end

    respond_to do |format|
      format.js {}
    end
  end
end