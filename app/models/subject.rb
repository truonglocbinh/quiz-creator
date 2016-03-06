class Subject < ActiveRecord::Base
  has_many :exams
  has_many :questions
  belongs_to :user

  validates :title, presence: true
end
