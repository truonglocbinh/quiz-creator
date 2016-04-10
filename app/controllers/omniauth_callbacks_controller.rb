class OmniauthCallbacksController < ApplicationController
  skip_before_filter :authenticate_user!

  def all
    p env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"])
    unless user.nil?
      sign_in_and_redirect user
    else
      session[:email] = env["omniauth.auth"].uid + "@quiz-creator.com"
      redirect_to socials_infor_url
    end
  end

  def failure
    super
  end

  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end