class Question < ActiveRecord::Base
  enum question_type: [:single_choice, :multiple_choice, :text]
  has_many :answers

  belongs_to :exam
  belongs_to :subject

  validates :title, presence: true
  # validate :need_answer_correct
  # validate :need_content_answer
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:content].blank?},
                                allow_destroy: true

  # private
  # def need_answer_correct
  #   byebug
  #   unless self.question_type == 2
  #     self.answers.each do |answer|
  #       if answer.correct
  #         break
  #       elsif answer == answers.last
  #         errors.add :answer, I18n.t("message.no_correct")
  #       end
  #     end
  #   end
  # end
  # def need_content_answer
  #   unless self.question_type == 2
  #     self.answers.each do |answer|
  #       if answer.content == ""
  #         errors.add :answer, I18n.t("message.need_content")
  #       end
  #     end
  #   end
  # end
end
