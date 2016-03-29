class UserGroupsController < ApplicationController
  before_action :load_group, only: [:index]
  def index
    @students = @group.users
  end

  private
  def load_group
    @group = Group.find params[:group_id]
  end
end
