class ChatsController < ApplicationController
  before_action :set_chat, only: [:edit, :update, :destroy]

  def index
    @chats = current_user.hosted_chats + current_user.chats
    @chats = @chats.paginate(page: params[:page], per_page: 30)
  end

  def hosted_chats
    @chats = current_user.hosted_chats
    @chats = @chats.paginate(page: params[:page], per_page: 30)
  end

  def joined_chats
    @chats = current_user.chats
    @chats = @chats.paginate(page: params[:page], per_page: 30)
  end

  def show
    @chat = Chat.find(params[:id])
    redirect_to root_path unless chat_joined?(current_user, @chat)
    @message = Message.new
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

  private

  def chat_params
    params.require(:chat).permit(:name)
  end

  def set_chat
    @chat = Chat.find(params[:id])
    redirect_to root_path unless @chat.host === current_user
  end
end
