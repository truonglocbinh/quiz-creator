class Exam < ActiveRecord::Base
  has_attached_file :avatar
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..2.megabytes }

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions

  belongs_to :user
  belongs_to :subject
  belongs_to :category

  validates :title, presence: true
  validates :user_id, presence: true
end
