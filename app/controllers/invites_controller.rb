class InvitesController < ApplicationController
  def create
    
    respond_to do |format|
      format.js {}
    end
  end
end
