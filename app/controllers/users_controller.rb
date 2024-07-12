class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  
  def edit
    authorize @user
  end

  def show
    authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)
    redirect_to company_path(@user.company_id)
  end

  def index
    authorize User
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:role,:password,:password_confirmation)
  end
end
