class SettingsController < ApplicationController
  before_action :load_exam

  def show
    @setting = @exam.setting
  end

  def update
    if @exam.setting.update_attributes setting_params
      flash[:success] = t "flash.update_success"
      redirect_to @exam
    else
      flash[:danger] = t "flash.update_failed"
      render :show
    end
  end

  private
  def load_exam
    @exam = Exam.find params[:exam_id]
  end

  def setting_params
    params.require(:setting).permit :score, :time_limit,
      :order_question, :order_answer, :send_email
  end
end
