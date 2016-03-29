class UsersController < ApplicationController
  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in_and_redirect user
    else
      redirect_to socials_infor_url
    end
  end

  private
  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
