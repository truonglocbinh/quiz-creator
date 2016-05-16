class User::ResultsController < ApplicationController
  before_action :authenticate_student
  def results
  	@exam_user = ExamUser.find params[:id]
  	@duration = @exam_user.exam.setting.time_limit
  	@questions = @exam_user.exam.questions
  end

  private
  def authenticate_student
  	@exam_user = ExamUser.find params[:id]
    if @exam_user.user != current_user && @exam_user.exam.user != current_user
      flash[:danger] = "Sorry you can not view result of this exam !"
      redirect_to root_url
    end
  end
end
