class SubjectsController < ApplicationController
  before_action :load_subject, only: [:show, :edit, :update, :destroy]
  def index
    @subjects = current_user.subjects.paginate page: params[:page], per_page: 10
  end

  def show
    @questions = @subject.questions
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = current_user.subjects.build subject_params
    if @subject.save
      flash[:success] = t "flash.create_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    @subject = @subject.update_attributes subject_params
    if @subject.save
      flash[:success] = "flash.update_success"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "flash.delete_success"
    else
      flash[:danger] = t "flash.delete_failed"
    end
    redirect_to subjects_path
  end

  private
  def load_subject
    @subject = Subject.find params[:id]
  end

  def subject_params
    params.require(:subject).permit :title, :description
  end
end
