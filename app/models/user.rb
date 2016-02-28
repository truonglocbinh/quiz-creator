class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.uid + "@quiz-creator.com"
      user.name     = auth.info.name
      user.password = Devise.friendly_token
      user.password_confirmation = user.password
      user.save
    end
  end
end
