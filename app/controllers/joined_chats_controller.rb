class JoinedChatsController < ApplicationController
  def index
    
  end

  def ajax_joined_chat_create
    

    respond_to do |format|
      format.js {}
    end
  end
end
