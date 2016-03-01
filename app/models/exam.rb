class Exam < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions

  belongs_to :user
  belongs_to :subject
  belongs_to :category

  validates :title, presence: true
  validates :user_id, presence: true
end
