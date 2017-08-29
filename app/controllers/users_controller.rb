class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def index
    @users = User.all.order(created_at: 'desc')
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.where(receiver: @user.id)
    @message = Message.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      if @user.update(params.require(:user).permit(:family_name, :first_name, :self_introduction, :age))
        flash[:notice] = "ユーザー情報が更新されました"
        redirect_back(fallback_location: user_path(@user))
      else
        flash[:alert] = "ユーザー情報の更新に失敗しました"
        render 'edit'
      end
    else
      redirect_to root_path
      flash[:alert] = "無効なユーザーです。"
    end
  end
end
