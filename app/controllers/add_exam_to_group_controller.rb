require "will_paginate/array"
class AddExamToGroupController < ApplicationController
  def add_exam
    @group = Group.find params[:group_id]
    @exams = current_user.exams
  end
end
