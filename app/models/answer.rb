class Answer < ActiveRecord::Base
  has_attached_file :avatar
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..2.megabytes }

  belongs_to :question
  has_many	:results
  validates :content, presence: true
  scope :correct, -> {where correct: true}
end
