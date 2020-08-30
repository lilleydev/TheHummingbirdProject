class User < ApplicationRecord
  rolify
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :created_projects, class_name: 'Project'
  has_secure_password
end
