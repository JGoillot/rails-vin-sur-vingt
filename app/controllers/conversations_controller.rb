class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new

    @messages = @conversation.messages
  end
end
