class QuestionsController < ApplicationController
  before_action :load_exam, only: [:new, :create]

  def index
  end

  def new
    @question = @exam.questions.build
    @question.answers.build
  end

  def create
    @question = @exam.questions.build question_params
    if @question.save
      redirect_to new_exam_question_path(@exam)
    else
      render :new
    end
  end

  private
  def load_exam
    @exam = Exam.find params[:exam_id]
  end

  def question_params
    params.require(:question).permit :title, :feedback, :question_type,
      :exam_id, :subject_id, answers_attributes: [:content, :correct, :_destroy]
  end
end
