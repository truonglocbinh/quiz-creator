class MyClassController < ApplicationController
  def all_class
    @my_classes = current_user.joined_groups
  end

  def show_one_class
  	@class = Group.find params[:class_id]
  	@exam_users = @class.exam_users.where user_id: current_user
  end

  def main
  	@exam_user = ExamUser.find params[:exam_user_id]
  	@questions = @exam_user.exam.questions
  end
end
