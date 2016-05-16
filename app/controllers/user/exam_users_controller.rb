class User::ExamUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_exam_user, only: [:show, :update]
  before_action :authenticate_student
  def show
    @notice = Notification.new from: current_user.id, 
      to: @exam_user.exam.user.id, 
      content: "#{current_user.name} has been start #{@exam_user.exam.title}"
    @duration = @exam_user.exam.setting.time_limit
    if @exam_user.time_start == nil
      @time_start = Time.now
      @exam_user.update_attributes time_start: @time_start
    else
      @time_start = @exam_user.time_start
    end
    @questions = @exam_user.exam.questions
    @exam_user.results = @exam_user.exam.setting.order_question ? @exam_user.results.shuffle : @exam_user.results
  end

  def update
    	@exam_user.update_attributes time_end: Time.now, status: :finished 
      exam_user_params[:results_attributes].each do |key,value|
        if value.has_key?("answer_id")
          if value[:answer_id].size == 1 
            Result.find(value[:id]).update_attributes answer_id: value[:answer_id][0]
          elsif value[:answer_id].size > 1 
            value[:answer_id].each_with_index do |val,index|
              if index == 0
                Result.find(value[:id]).update_attributes answer_id: val
              else
                @clone = Result.find(value[:id])
                Result.create! exam_user_id: @clone.exam_user_id, question_id: @clone.question_id, answer_id: val
              end
            end
          end
        end
      end
    flash[:success] = "Thank you !"
    redirect_to show_class_path(class_id: @exam_user.group.id)
  end

  private
  def load_exam_user
  	@exam_user = ExamUser.find params[:id]
  end

  def exam_user_params
    params.require(:exam_user).permit  :user_id, :exam_id, :group_id,
      :status, :start_date, :end_date, results_attributes: [:id, :answer_id, answer_id: []]
  end

  def authenticate_student
    if @exam_user.user != current_user
      flash[:danger] = "Sorry you can not take this exam !"
      redirect_to root_url
    end
  end
end
