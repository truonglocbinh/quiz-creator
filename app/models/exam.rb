class Exam < ActiveRecord::Base
  has_attached_file :avatar
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..2.megabytes }
  ATTRIBUTES_PARAMS = [:title, :category_id, :description, :subject_id, :avatar]

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :exam_groups
  has_many :groups, through: :exam_groups
  has_one  :setting
  belongs_to :user
  belongs_to :subject
  belongs_to :category

  validates :title, presence: true
  validates :user_id, presence: true

  after_create :init_setting
  def self.search_by_title title
    @exams = Exam.where("title LIKE ?", "%#{title}%")
  end

  private
  def init_setting
    self.create_setting
  end
end
