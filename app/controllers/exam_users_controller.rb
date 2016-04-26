class ExamUsersController < ApplicationController
  before_action :load_group, only: [:show, :edit]

  def show
    @exam_user = ExamUser.find params[:id]
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @exam_user = ExamUser.find params[:id]
    if @exam_user.update_attributes exam_user_params
      respond_to do |format|
        @success = "Update successfully !"
        format.html{}
        format.js {}
      end
    else
      respond_to do |format|
        format.html{}
        format.js {}
      end
    end
  end

  private
  def exam_user_params
    params.require(:exam_user).permit  :user_id, :exam_id, :group_id,
      :status, :start_date, :end_date
  end
  def load_group
    @group = Group.find params[:group_id]
  end
end
