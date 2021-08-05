class InvitesController < ApplicationController
  def invite
    @chat = Chat.find(params[:id])
    redirect_to root_path unless current_user.hosted_chats.include?(@chat)
    @friends = friend_list(current_user)
    @friends = @friends.paginate(page: params[:page], per_page: 21)
  end

  def invitations
    @invites = current_user.invites_as_guest
  end

  def ajax_invite_create
    @guest = User.find(params[:guest_id])
    @chat = Chat.find(params[:chat_id])

    @invite_created = false

    if !invite_exists?(current_user, @guest, @chat) && 
    current_user.hosted_chats.include?(@chat) && 
    params[:host_id].to_i === current_user.id && 
    is_friend?(current_user, @guest) && 
    !chat_joined?(@guest, @chat)
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
