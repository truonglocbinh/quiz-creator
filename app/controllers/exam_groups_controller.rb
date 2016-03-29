class ExamGroupsController < ApplicationController
  before_action :load_group, only: [:index]

  def index
    @exams = @group.exams
  end

  private
  def load_group
    @group = Group.find params[:group_id]
  end
end
