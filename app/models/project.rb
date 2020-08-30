class Project < ApplicationRecord
  has_many :users, through: :user_projects
  has_many :user_projects
  has_many :reviews
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
end
