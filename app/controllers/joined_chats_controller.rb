class JoinedChatsController < ApplicationController
  def index
    
  end

  def ajax_joined_chat_create
    @host = User.find(params[:host_id])
    @guest = User.find(params[:guest_id])
    @chat = Chat.find(params[:chat_id])

    @is_created = false

    unless 
    @guest.id === current_user.id && 
    @host.hosted_chats.include?(@chat) &&
    is_friend?(@host, @guest)
      return
    end

    invite = Invite.find_by(
      host_id: @host.id, 
      guest_id: @guest.id, 
      chat_id: @chat.id 
    )

    if params[:choice] === "Accept"
      JoinedChat.create(user_id: @guest.id, chat_id: @chat.id)
      @is_created = true
      invite.destroy
    elsif params[:choice] === "Decline"
      invite.destroy
    end

    respond_to do |format|
      format.js {}
    end
  end
end
