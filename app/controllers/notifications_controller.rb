class NotificationsController < ApplicationController
  def index
    @notices = Notification.where(to: current_user.id).order "created_at DESC"
  end

  def destroy
    @notice = Notification.find params[:id]
    if @notice.destroy
      flash[:success] = "Successfully deteled..."
      redirect_to notifications_path
    else
      flash[:danger] = "Delete not success"
    end
  end
end
