class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show
    conversations = Conversation.all
    conversation = conversations.find(params[:id])
    @messages = conversation.messages
  end
end
