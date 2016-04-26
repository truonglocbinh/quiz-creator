# puts "Faker User"
# @user = User.create!(email: "admin@hust.com", name: "admin", password: "12345678", password_confirmation: "12345678", role: 0)

# 100.times do |n|
#   User.create!(email: "quiz-#{n}@hust.com", name: Faker::Name.name, password: "12345678", password_confirmation: "12345678")
# end

# 100.times do |n|
#   Category.create(title: Faker::Commerce.department(2, true))
# end 

# 100.times do |n|
#   @exam = Exam.create!(title: Faker::Hipster.sentence(3, true), user_id: @user.id, description: Faker::Lorem.sentence)
# end

# @exam = Exam.second
# 5.times do |n|
#   @question = Question.create!(title: Faker::Name.name, feedback: Faker::Lorem.sentence,question_type: 0, exam_id: @exam.id)
#   4.times do |n|
#     if n == 1
#       Answer.create!(content: Faker::Lorem.sentence, correct: true, question_id: @question.id)
#     else
#       Answer.create!(content: Faker::Lorem.sentence, correct: false, question_id: @question.id)
#     end
#   end
# end
@group = Group.first
@users = User.all - [User.first] 
@users.each do |user|
  UserGroup.create user_id: user.id, group_id: @group.id
end