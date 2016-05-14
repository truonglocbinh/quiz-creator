class Notification < ActiveRecord::Base
  enum no_type: [:notice, :remine]
  belongs_to :user, class_name: User.name, foreign_key: "to"
  scope :no_seen, ->{where seen: false}
end
