class MyClassController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_member, only: :show_one_class
  def all_class
    @my_classes = current_user.joined_groups
    add_breadcrumb "My class"
  end

  def show_one_class
  	@class = Group.find params[:class_id]
  	@exam_users = @class.exam_users.where user_id: current_user
  end

  def main
  	@exam_user = ExamUser.find params[:exam_user_id]
  	@questions = @exam_user.exam.questions
  end

  private
  def authenticate_member
    @class = Group.find params[:class_id]
    unless @class.users.include? current_user
      flash[:danger] = "Sorry! You are not a member of this class"
      redirect_to root_url
    end
  end
end
