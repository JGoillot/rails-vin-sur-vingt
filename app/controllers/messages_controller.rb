class MessagesController < ApplicationController

  before_action :find_cellar, only: [ :new, :create ]
  def create

    @conversation = Conversation.where(user: current_user, cellar: @cellar).take
    @conversation = Conversation.create(user: current_user, cellar: @cellar) unless @conversation

    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = @conversation
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      render :new
    end
  end

  def new
    @message = Message.new
  end

  private

  def find_cellar
    @cellar = Cellar.find(params[:cellar_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
