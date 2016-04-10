class ExamUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam
  belongs_to :group
  validate :start_date_must_less_than_end_date
  enum status: [:init, :starting, :finished]

  def self.filter_exam_user student, exam, status
    student_id = student == "all" ? Hash.new : {user_id: student.to_i}
    exam_id = exam == "all" ? Hash.new : {exam_id: exam.to_i}
    status = status == "all" ? Hash.new : {status: status.to_sym}
    sql = student_id.merge(exam_id).merge(status)
    @exam_users = ExamUser.where sql
  end

  private
  def start_date_must_less_than_end_date
    if self.start_date >= self.end_date
      errors.add(:time, "start must less than end date")
    elsif start_date <= Time.now
      errors.add(:time, "start date must more than time now")
    end
  end

  # def convert_time
  #   self.start_date = self.start_date.to_datetime
  #   self.end_date = self.end_date.to_datetime
  # end
end

