# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create!(email: "admin@hust.com", name: "admin", password: "12345678", password_confirmation: "12345678", role: 0)
Category.create!(title: "IT")
Category.create!(title: "Economy")
Category.create!(title: "Education")
Category.create!(title: "Foreiner Language")
Category.create!(title: "History")
100.times do |n|
  @exam = @user.exams.build title: "test #{n}"
  @exam.save
end
100.times do |n|
  User.create!(email: "quiz-#{n}@hust.com", name: "name is #{n}", password: "12345678", password_confirmation: "12345678")
end
100.times do |n|
  @exam = Exam.create!(title: Faker::Name.name, user_id: @user.id, description: Faker::Lorem.sentence)
end
@exam = Exam.first
30.times do |n|
  @question = Question.create!(title: Faker::Name.name, feedback: Faker::Lorem.sentence,question_type: 0, exam_id: @exam.id)
  4.times do |n|
    if n == 1
      Answer.create!(content: Faker::Lorem.sentence, correct: true, question_id: @question.id)
    else
      Answer.create!(content: Faker::Lorem.sentence, correct: false, question_id: @question.id)
    end
  end
end
# @group = Group.find 1
# @users = User.all.take 10
# @users.each do |user|
#   UserGroup.create!(user: user, group: @group)
# end
