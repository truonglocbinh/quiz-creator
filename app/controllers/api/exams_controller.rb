class Api::ExamsController < ApplicationController
  def index
    @title = params[:title]
    @exams = Exam.search_by_title @title
    respond_to do |format|
      format.html { render partial: "index", locals: {exams: @exams}  }
      format.js {}
    end
  end
end
