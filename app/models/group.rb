class Group < ActiveRecord::Base
  belongs_to :owner, class_name: User.name, foreign_key: "user_id"

  validates :name, presence: true
  validates :user_id, presence: true
end
