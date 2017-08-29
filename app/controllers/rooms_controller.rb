class RoomsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :show, :index, :edit, :update]

  def create
    @room = Room.create
    redirect_to room_path(@room.id)
    flash[:notice] = "チャットを作成しました。"
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def room_params
    params.require(:room).permit(:name, :explain)
  end
end
