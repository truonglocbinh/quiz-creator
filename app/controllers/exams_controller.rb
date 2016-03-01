class ExamsController < ApplicationController
  before_action :load_exam, except: [:index, :create, :new]
  def index
    @exams = current_user.exams.paginate page: params[:page], per_page: 10
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = current_user.exams.build exam_params
    if @exam.save
      redirect_to @exam
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exam.update_attributes exam_params
      flash[:success] = t "flash.update_exam"
      redirect_to @exam
    else
      render :edit
    end
  end

  private
  def load_exam
    @exam = Exam.find_by_id params[:id]
  end

  def exam_params
    params.require(:exam).permit :title, :category_id, :description, :subject_id
  end
end
