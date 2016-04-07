class StaticPageController < ApplicationController
  def home
    if current_user
      @notifications = Notification.where(to: current_user.id).order("created_at DESC").take 3
    end
  end

  def about
  end
end
