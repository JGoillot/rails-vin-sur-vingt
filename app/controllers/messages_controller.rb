class MessagesController < ApplicationController

  before_action :find_cellar, only: [ :new, :create ]
  def create
   @message = Message.new(message_params)
   @message.cellar = @cellar
   @message.user = current_user
    if @message.save
      redirect_to conversations_path
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
