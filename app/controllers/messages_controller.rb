class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @message = Message.create(params.require(:message).permit(:content, :user_id, :room_id).merge(user_id: current_user.id))
    redirect_back(fallback_location: room_path(@message.room_id))
  end
end
