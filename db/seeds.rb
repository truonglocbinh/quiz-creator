# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Category.create!(title: "IT")
# Category.create!(title: "Economy")
# Category.create!(title: "Education")
# Category.create!(title: "Foreiner Language")
# Category.create!(title: "History")
@user = User.first
100.times do |n|
  @exam = @user.exams.build title: "test #{n}"
  @exam.save
end


