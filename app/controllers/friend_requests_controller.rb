class FriendRequestsController < ApplicationController
  def ajax_friend_request
    @requestor = User.find(params[:requestor_id])
    @receiver = User.find(params[:receiver_id])

    @friend_request = FriendRequest.find_by(requestor_id: @requestor.id, receiver_id: @receiver.id)

    unless @requestor === @receiver || !@friend_request.nil?
      @request_text = "Sent"
      FriendRequest.create(requestor_id: @requestor.id, receiver_id: @receiver.id);
    else
      @request_text = "Add"
    end

    respond_to do |format|
      format.js {}
    end
  end
end
