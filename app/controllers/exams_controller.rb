class ExamsController < ApplicationController
  before_action :load_exam, except: [:index, :create, :new]
  def index
    @exams = current_user.exams.order("created_at DESC").paginate page: params[:page], per_page: 10
  end

  def show
    @questions = @exam.questions
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => '#{@exam.title}',
        :template => 'exams/show.pdf.erb',
        :layout => 'pdf_layout.html.erb',
        :show_as_html => params[:debug].present?
      end
    end
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
    params.require(:exam).permit Exam::ATTRIBUTES_PARAMS
  end
end
