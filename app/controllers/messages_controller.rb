class MessagesController < ApplicationController
  before_action :set_message, only: [:destroy]

  def create
    return unless message_params[:user_id].to_i === current_user.id
    @chat = Chat.find(message_params[:chat_id])
    @message = Message.new(message_params)
    @message.save

    ActionCable.server.broadcast(
      "chat_channel_#{@message.chat_id}", 
      {
        message: @message.content, 
        author_id: current_user.id, 
        username: current_user.username,
        chat_id: @chat.id,
        message_id: @message.id,
        action: "create",
      }
    )
  end

  def destroy
    @message = Message.find(params[:id])
    @chat = Chat.find(@message.chat_id)
    @message.destroy

    ActionCable.server.broadcast(
      "chat_channel_#{@message.chat_id}", 
      {
        message: @message.content, 
        author_id: current_user.id, 
        username: current_user.username,
        chat_id: @chat.id,
        message_id: @message.id,
        action: "destroy"
      }
    )
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id, :user_id)
  end

  def set_message
    @message = Message.find(params[:id])
    redirect_to root_path unless @message.user === current_user
  end
end
