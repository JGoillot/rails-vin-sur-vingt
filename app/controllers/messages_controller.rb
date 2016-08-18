class MessagesController < ApplicationController

  before_action :find_cellar, only: [ :new, :create ]

  def create
    if params[:cellar_id]
      @conversation = Conversation.where(user: current_user, cellar: @cellar).take
      @conversation = Conversation.create(user: current_user, cellar: @cellar) unless @conversation
    else
      @conversation = Conversation.find(params[:conversation_id])
    end

    @message = current_user.messages.new(message_params)
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
    @cellar = Cellar.find(params[:cellar_id]) if params[:cellar_id]
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
