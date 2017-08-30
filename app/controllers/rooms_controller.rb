class RoomsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :show, :index, :edit, :update]

  def create
    @room = Room.create
    @entry1 = Entry.create(user_id: current_user.id, room_id: @room.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
    flash[:notice] = "チャットを作成しました。"
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  end

  def index
    @rooms = Room.all
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "チャット情報が変更されました。"
      redirect_back(fallback_location: edit_room_path(@room.id))
    else
      render 'edit'
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :explain)
  end
end