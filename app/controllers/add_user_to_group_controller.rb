class AddUserToGroupController < ApplicationController
  def find_user
    @group = Group.find params[:group_id]
  end

  def result_of_find_user
    @user = User.find_by_email params[:user][:email]
    @group = Group.find params[:user][:group_id]
    if @user
      if UserGroup.find_by user_id: @user.id, group_id: @group.id
        @errors = "#{@user.email} has been a member of group "
      else

        Notification.create!(
          from: current_user.id,
          to: @user.id,
          content: "#{current_user.email} has invited you to joined #{@group.name}")

        UserGroup.create!(user_id: @user.id, group_id: @group.id)
      end
    else
      @errors = "#{params[:user][:email]} is not valid user !"
    end
    respond_to do |format|
      format.js {}
    end
  end
end
