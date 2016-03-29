class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Successfully created..."
      redirect_to admin_users_path
    else
      flash[:danger] = "Failed"
      render :new
    end
  end

  def update

  end

  private
  def user_params
    params.require(:user).permit User::ADMIN_PARAMS
  end
end
