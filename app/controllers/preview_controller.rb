class PreviewController < ApplicationController
  before_action :load_object, only: [:show, :main]
  def show
  end

  def main
    @questions = @exam.questions
  end

  private
  def load_object
    @exam = Exam.find params[:id]
  end
end
