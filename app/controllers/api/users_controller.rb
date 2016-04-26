class Api::UsersController < ApplicationController
  def index
    @email = params[:email]
    @role = params[:role]
    @users = User.filter_user @role, @email
    @users = @users.page(params[:my_page])
    respond_to do |format|
      format.html {render partial: "index", locals: {users: @users}}
    end
  end
end
