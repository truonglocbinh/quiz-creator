class Api::NotificationsController < ApplicationController
  def index
  	@notifications = current_user.notifications.no_seen
  	@number = @notifications.size
  	@notifications.update_all seen: true
  	respond_to do |format|
      format.js {render "api/notifications/index.js.erb"}
    end
  end
end
