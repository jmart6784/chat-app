class InvitesController < ApplicationController
  def invite
    @chat = Chat.find(params[:id])
    @friends = friend_list(current_user)
  end

  def ajax_invite_create
    

    respond_to do |format|
      format.js {}
    end
  end
end
