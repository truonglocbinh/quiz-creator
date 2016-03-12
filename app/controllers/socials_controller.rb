class SocialsController < ApplicationController
  def infor
    @user = User.new
    @email = session[:email]
  end
end
