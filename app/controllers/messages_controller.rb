class MessagesController < ApplicationController
  def create
    return unless message_params[:user_id].to_i === current_user.id
    @chat = Chat.find(message_params[:chat_id])
    @message = Message.new(message_params)
    @message.save
    redirect_to @chat
  end

  def destroy
    @message = Message.find(params[:id])
    @chat = Chat.find(@message.chat_id)
    @message.destroy
    redirect_to @chat
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id, :user_id)
  end
end
