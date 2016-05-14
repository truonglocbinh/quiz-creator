class UserGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_group, only: [:index]

  def index
    add_breadcrumb "#{@group.name}", @group
    add_breadcrumb "Users"
    @students = @group.users.paginate page: params[:page], per_page: 10
  end

  def destroy
    @user_group = UserGroup.find params[:id]
    if @user_group.destroy
      flash[:success] = "Remove successfully"
    else
      flash[:danger] = "Remove failed"
    end
    redirect_to :back
  end
  private
  def load_group
    @group = Group.find params[:group_id]
  end
end
