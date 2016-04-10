class NotificationsController < ApplicationController
  def index
    @notices = Notification.where(to: current_user.id).order "created_at DESC"
  end

  def create
    @notification = Notification.new notification_params
    if @notification.save
      respond_to do |format|
        format.html
        format.js
      end
    end
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
  private
  def notification_params
    params.require(:notification).permit :from, :to, :type, :content    
  end
end
