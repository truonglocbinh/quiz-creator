class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_onwer, except: [:index, :new]
  before_action :load_exam, except: [:index, :create, :new]
  add_breadcrumb "My Exams", :exams_path
  def index
    @exams = current_user.exams.order("created_at DESC").paginate page: params[:page], per_page: 10
  end

  def show
    add_breadcrumb "#{@exam.title}", @exam
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
    add_breadcrumb "New"
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
    add_breadcrumb "#{@exam.title}", @exam
    add_breadcrumb "Edit"
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

  def authenticate_onwer
    @exam = Exam.find_by_id params[:id]
    unless @exam.user == current_user
      flash[:danger] = "Sorry you can access this resources"
      redirect_to root_url
    end
  end
end
