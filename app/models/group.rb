class Group < ActiveRecord::Base
  belongs_to :owner, class_name: User.name, foreign_key: "user_id"
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :exam_groups
  has_many :exams, through: :exam_groups

  ATTRIBUTES_PARAMS = [:name, :description, exam_ids:[]]

  accepts_nested_attributes_for :exams, allow_destroy: true

  validates :name, presence: true
  validates :user_id, presence: true

  def self.filter_by_name name
    @groups = Group.where("name LIKE ?", "%#{name}%")
  end
end
