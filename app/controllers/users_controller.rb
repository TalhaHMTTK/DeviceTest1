class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:email,:role,:password,:password_confirmation))
    redirect_to company_path(@user.company_id)
  end

  def index
    @users = User.all
  end

end
