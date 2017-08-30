class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:content, :user_id, :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "無効なユーザー"
    end
    redirect_back(fallback_location: rooms_path)
  end
end
