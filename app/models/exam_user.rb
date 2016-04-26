class ExamUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam
  belongs_to :group
  has_many   :results
  has_many   :questions, through: :results
  has_many   :answers, through: :results
  validate :start_date_must_less_than_end_date, on: :update

  enum status: [:init, :starting, :finished]

  accepts_nested_attributes_for :results, reject_if: proc { |attributes| attributes['answer_id'] == 0 }, allow_destroy: true
  before_create :add_question

  def self.filter_exam_user student, exam, status
    student_id = student == "all" ? Hash.new : {user_id: student.to_i}
    exam_id = exam == "all" ? Hash.new : {exam_id: exam.to_i}
    status = status == "all" ? Hash.new : {status: statuses[status]}
    sql = student_id.merge(exam_id).merge(status)
    @exam_users = ExamUser.where sql
  end

  def score
    score = 0
    self.exam.questions.each do |question|
      array_1 = question.answers.correct.pluck(:id)
      array_2 = Result.where(question: question).pluck(:answer_id)
      if array_1 == array_2
        score = score + 1
      end
    end
    score
  end

  private
  def add_question
    self.questions = self.exam.questions  
  end

  def start_date_must_less_than_end_date
    if self.start_date >= self.end_date
      errors.add(:time, "start must less than end date")
    elsif start_date <= Time.now
      errors.add(:time, "start date must more than time now")
    end
  end
end

