class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  rolify
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :created_projects, class_name: 'Project'

  def self.find_for_google_oauth2(access_token, _signed_in_resource = nil)
    # byebug
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid).first
    if user
      user
    else
      registered_user = User.where(email: access_token.info.email).first
      if registered_user
        registered_user
      else
        user = User.create(first_name: data['first_name'], second_name: data['last_name'],
                           provider: access_token.provider,
                           email: data['email'],
                           uid: access_token.uid,
                           password: Devise.friendly_token[0, 20])
      end
    end
      end

  # def self.find_or_create_from_auth_hash(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.first_name = auth.info.first_name
  #     user.last_name = auth.info.last_name
  #     user.email = auth.info.email
  #     user.picture = auth.info.image
  #     user.save!
  #   end
  # end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #   end
  # end
end
