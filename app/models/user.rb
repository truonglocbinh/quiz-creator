class User < ActiveRecord::Base
  has_attached_file :avatar
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..2.megabytes }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  enum role: [:admin, :customer]

  has_many :exams, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :joined_groups, through: :user_groups, source: :group
  ATTRIBUTES_PARAMS = [:email, :password, :password_confirmation, :name]
  ADMIN_PARAMS = [:email, :password, :password_confirmation, :role]
  def self.filter_user role, email
    if role == "all"
      @users = User.where("email LIKE ?", "%#{email}%")
    else
      @users = User.where("role = ? AND email LIKE ? ", role, "%#{email}%")
    end
    @users
  end

  def self.from_omniauth auth
    user = User.find_by_email auth.uid + "@quiz-creator.com"
    user
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.uid + "@quiz-creator.com"
    #   user.name     = auth.info.name
    #   user.password = Devise.friendly_token
    #   user.password_confirmation = user.password
    #   user.save
    # end
  end
  # def self.from_omniauth auth
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.uid + "@quiz-creator.com"
  #     user.name     = auth.info.name
  #     user.password = Devise.friendly_token
  #     user.password_confirmation = user.password
  #     user.save
  #   end
  # end
end
