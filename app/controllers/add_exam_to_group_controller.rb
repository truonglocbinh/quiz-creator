require "will_paginate/array"
class AddExamToGroupController < ApplicationController
  before_action :authenticate_user!
  def add_exam

    @group = Group.find params[:group_id]
    @exams = current_user.exams
    add_breadcrumb "#{@group.name}", @group
    add_breadcrumb "Add Exam"
  end
end
