class ReportsController < ApplicationController
  def show
  	@group = Group.find params[:group_id]
  	@exams = @group.exams
  end

  def get_report
    @group = Group.find params[:exam][:group_id]
  	@exam = Exam.find params[:exam][:id]
    @exam_users = @group.exam_users.where(exam_id: @exam.id)
  	if @exam
  	  respond_to do |format|
      	format.js {}
      end
  	end
  end
end
