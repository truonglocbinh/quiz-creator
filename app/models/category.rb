class Category < ActiveRecord::Base
  has_many :exams
  ATTRIBUTES_PARAMS = [:title]

  def self.search_by_title title
    @categories = Category.where("title LIKE ?", "%#{title}%")
  end
end
