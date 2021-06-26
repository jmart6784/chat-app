class InvitesController < ApplicationController
  def invite
    @chat = Chat.find(params[:id])
    @friends = friend_list(current_user)
  end

  def invitations
    
  end

  def ajax_invite_create
    @guest = User.find(params[:guest_id])
    @chat = Chat.find(params[:chat_id])

    existing_invite = Invite.find_by(
      host_id: current_user.id, 
      guest_id: @guest.id,
      chat_id: @chat.id
    )

    @invite_created = false

    if existing_invite.nil? && current_user.hosted_chats.include?(@chat) && params[:host_id].to_i === current_user.id
      @invite_created = true
      Invite.create(
        host_id: current_user.id, 
        guest_id: @guest.id,
        chat_id: @chat.id
      )
    end

    respond_to do |format|
      format.js {}
    end
  end
end
