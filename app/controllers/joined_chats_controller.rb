class JoinedChatsController < ApplicationController
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

  def ajax_joined_chat_destroy
    @chat = Chat.find(params[:chat_id])
    @guest = User.find(params[:guest_id])
    @host = User.find(params[:host_id])

    @joined_chat = JoinedChat.find_by(
      user_id: @guest.id, 
      chat_id: @chat.id
    )

    if params[:choice] === "leave"
      if chat_joined?(@guest, @chat) &&
      @guest === current_user
        @joined_chat.destroy
        redirect_to joined_chats_path
      end
    elsif params[:choice] === "kick"
      if chat_joined?(@guest, @chat) &&
      @chat.host === @host &&
      current_user === @host
        @joined_chat.destroy
      end
    end

    respond_to do |format|
      format.js {}
    end
  end
end
