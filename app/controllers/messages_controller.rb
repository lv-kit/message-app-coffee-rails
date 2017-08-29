class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @message = Message.create(params.require(:message).permit(:content, :user_id, :receiver).merge(user_id: current_user.id))
    redirect_back(fallback_location: user_path(@message.receiver))
  end
end
