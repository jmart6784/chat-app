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
    @messages = @chat.messages.order('created_at ASC')

    if @messages.length >= 10
      @messages = @messages[-10..@chat.messages.length - 1]
    end

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

  def more_messages
    @chat = Chat.find(params[:chat_id])
    
    if chat_joined?(current_user, @chat)
      @new_start = params[:start].to_i
      @messages = @chat.messages.order('created_at ASC')
  
      temp_ary = []
  
      10.times do
        @new_start -= 1
        next if @messages[@new_start].nil?
        temp_ary << @messages[@new_start]
      end
  
      @messages = temp_ary
  
      respond_to do |format|
        format.js {}
      end
    end
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
