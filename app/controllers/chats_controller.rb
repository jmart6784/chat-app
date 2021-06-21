class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.host_id = current_user.id

    if @chat.save
      redirect_to @chat
    else 
      flash.now[:danger] = "Can't create this Chat room, there are errors."
      render "new"
    end
  end

  def ajax_create_chat

  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end
end
