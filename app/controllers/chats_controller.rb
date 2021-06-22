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

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    @chat.host_id = current_user.id
    @chat.update(chat_params)
    redirect_to chat_path(@chat)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path
  end

  def ajax_create_chat

  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end
end
