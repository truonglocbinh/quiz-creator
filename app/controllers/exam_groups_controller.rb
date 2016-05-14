class ExamGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_group, only: [:index]

  def index
  	add_breadcrumb "#{@group.name}", @group
  	add_breadcrumb "Exams"
    @exams = @group.exams
  end

  private
  def load_group
    @group = Group.find params[:group_id]
  end
end
