class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def index
    @users = User.all.order(created_at: 'desc')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
  end
end
