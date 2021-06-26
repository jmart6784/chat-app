class InvitesController < ApplicationController
  def invite
    
  end

  def ajax_invite_create
    
    respond_to do |format|
      format.js {}
    end
  end
end
