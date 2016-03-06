class Question < ActiveRecord::Base
  before_validation :need_answer_correct
  has_attached_file :avatar
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..2.megabytes }

  enum question_type: [:single_choice, :multiple_choice, :text]
  has_many :answers, dependent: :destroy

  belongs_to :exam
  belongs_to :subject

  validates :title, presence: true

  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:content].blank? || a[:id]  == "0"},
                                allow_destroy: true

  private
  def need_answer_correct
    unless self.text?
      if answers.size < 1
        errors[:base] << "no answer"
        false
      else
        if self.multiple_choice?
          self.answers.each do |answer|
            if answer.correct
              break
            elsif answer == answers.last
              errors.add :answer, I18n.t("message.no_correct")
              false
            end
          end
          true
        else
          true
        end
      end
    end
  end
end
