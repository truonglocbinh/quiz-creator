class Api::ExamUsersController < ApplicationController
  def index
    @student = params[:student]
    @exam = params[:exam]
    @status = params[:status]
    @group = params[:group]
    @exam_users = ExamUser.where(group_id: @group.to_i).filter_exam_user @student, @exam, @status
    respond_to do |format|
      format.html { render partial: "index", locals: {exam_users: @exam_users}  }
      format.js {}
    end
  end
end
