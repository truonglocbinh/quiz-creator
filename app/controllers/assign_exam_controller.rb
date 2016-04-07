class AssignExamController < ApplicationController
  def show
    @group = Group.find params[:group_id]
    @exams = @group.exams
    @students = @group.users
  end

  def assign
    group_id = params[:assign][:group_id]
    exam_id = params[:assign][:exam_id]
    user_ids = params[:user_ids]
    start_date = params[:start_date]
    end_date = params[:end_date]
    if user_ids
      if only_assign_one_exam(user_ids, exam_id, group_id) && time_validate(start_date, end_date)
        assign_student_to_exam user_ids, exam_id, group_id, start_date, end_date
        redirect_to Group.find(group_id)
      else
        @group = Group.find group_id
        @exams = @group.exams
        @students = @group.users
        render :show
      end
    else
      flash[:danger] = "You need to select at least one student"
      redirect_to :back
    end
  end

  private
  def only_assign_one_exam user_ids, exam_id, group_id
    @check = true
    user_ids.each do |user_id|
      @user_exam = ExamUser.where user_id: user_id, group_id: group_id, exam_id: exam_id
      if @user_exam.size > 1
        user = User.find user_id
        @errors = "User #{user.email} has assigned this exam."
        @check = false
        break
      end
    end
    @check
  end

  def assign_student_to_exam user_ids, exam_id, group_id, start_date, end_date
    user_ids.each do |user_id|
      group = Group.find group_id
      exam = Exam.find exam_id
      Notification.create!(
        to: user_id,
        from: current_user.id,
        content: "#{current_user.email} has assign #{exam.title} for you in #{group.name}")
      ExamUser.create!(user_id: user_id, group_id: group_id,
        exam_id: exam_id, start_date: start_date, end_date: end_date )
    end
  end

  def time_validate start_date, end_date
    if start_date >= end_date || start_date < Time.now
      @time_errors = "Has errors with time "
      return false
    end
    true
  end
end
