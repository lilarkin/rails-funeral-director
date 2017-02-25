class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :mortuaries

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create do |user|
      name = auth[:info][:name].split(' ')
      user.first_name = name.first
      user.last_name = name.last
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
