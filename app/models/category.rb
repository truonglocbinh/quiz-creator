class Category < ActiveRecord::Base
  has_many :exams
  ATTRIBUTES_PARAMS = [:title]
end
