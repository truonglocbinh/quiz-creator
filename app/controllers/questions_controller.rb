class QuestionsController < ApplicationController
  before_action :load_exam_or_subject, only: [:new, :create, :edit, :update]
  before_action :load_question, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = @temp.questions.build question_params
    if @question.save
      if params[:commit] == "Create and continue"
        redirect_to @link
      else
        redirect_to @temp
      end
    else
      @question.answers.build
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "flash.update_success"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "flash.delete_success"
    else
      flash[:danger] = t "flash.delete_failed"
    end
    redirect_to :back
  end

  private
  def load_exam_or_subject
    if params[:exam_id]
      @temp = Exam.find params[:exam_id]
      @link = new_exam_question_path(@temp)
    else
      @temp = Subject.find params[:subject_id]
      @link = new_subject_question_path(@temp)
    end
  end

  def load_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit Question::ATTRIBUTES_PARAMS
  end
end
