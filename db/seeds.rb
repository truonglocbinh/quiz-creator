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
# puts "Creating User"
#     User.create!([
#       {name: "Nguyen Binh Dieu", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Nguyen_Binh_Dieu.jpg")), role: 1, 
#         email: "nguyenbinhdieu@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Mai Tuan Viet", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Mai Tuan Viet.jpg")), role: 1, 
#         email: "supervisor@tms.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Truong Loc Binh", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Truong Loc Binh.jpg")), role: 0, 
#         email: "truonglocbinh@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Vu Duc Luan", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Vu Duc Luan.jpg")), role: 1, 
#         email: "vuducluan@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Ngo Van Thien ", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Ngo Van Thien.jpg")), role: 1, 
#         email: "ngovanthie@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Ngo Van Duong", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Ngo Van Duong.jpg")), role: 1, 
#         email: "ngovanduong@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Nguyen Thai Son", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Nguyen Thai Son.jpg")), role: 1, 
#         email: "nguyenthaison@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Mai Dinh Phu ", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Mai Dinh Phu.jpg")), role: 1, 
#         email: "maidinhphu@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Nguyen Van Hien", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Nguyen Van Hien.jpg")), role: 1, 
#         email: "nguyenvanhien@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Nguyen Thi Trang", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Nguyen Thi Trang.png")), role: 1, 
#         email: "nguyenthitrang@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Nguyen Thi Mo", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Nguyen Thi Mo.jpg")), role: 1, 
#         email: "nguyenthimo@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Hoang Van Nam", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Hoang Van Nam.jpg")), role: 1, 
#         email: "hoangvannam@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Du Thanh Hai", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Bui Quoc Viet.jpg")), role: 1, 
#         email: "duthanhhai@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Mai Dinh Phi", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Nguyen Tuan Trong.jpg")), role: 1, 
#         email: "maidinhphi@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Hoang Thi Linh", avatar: File.open(File.join(Rails.root, 
#         "app/assets/images/user/Hoang Thi Linh.jpg")), role: 1, 
#         email: "hoangthilinh@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Dinh Hoang Hai", avatar: nil, role: 1, 
#         email: "dinhhoanghai@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Nguyen Sinh", avatar: nil, role: 1, 
#         email: "nguyensinh@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Nguyen Tuan Trong", avatar: nil, role: 1, 
#         email: "nguyentuantrong@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Hoang Linh", avatar: nil, role: 1, 
#         email: "hoanglinh@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Truong Thi Thao", avatar: nil, role: 1, 
#         email: "truongthithao@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Can Van Nghi", avatar: nil, role: 1, 
#         email: "canvannghi@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Luu Binh", avatar: nil, role: 1, 
#         email: "luubinh@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Duong Phuong", avatar: nil, role: 1, 
#         email: "duongphuong@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Ha Linh", avatar: nil, role: 1, 
#         email: "halinh@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Ly Hoang Nam", avatar: nil, role: 1, 
#         email: "lyhoangnam@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Mai Thao", avatar: nil, role: 1, 
#         email: "maithao@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Dinh Phuong Linh", avatar: nil, role: 1, 
#         email: "dinhphuonglinh@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Minh Phuong", avatar: nil, role: 1, 
#         email: "minhphuong@gmail.com", password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "So khen", avatar: nil, role: 1, 
#         email: "sokhen@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Chenkim", avatar: nil, role: 1, 
#         email: "chenkim@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"},
#       {name: "Kooru", avatar: nil, role: 1, 
#         email: "kooru@gmail.com",  password: "12345678", 
#         password_confirmation: "12345678"}
#     ])

10.times do |n|
  Category.create!(name: )
