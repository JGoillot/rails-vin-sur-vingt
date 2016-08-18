class ConversationsController < ApplicationController
  def index
    @conversations = current_user.messages.select("DISTINCT ON(cellar_id) *").order("cellar_id, created_at DESC")
  end

  def show
    @messages = current_user.messages.where(cellar_id: params[:id])
  end
end
