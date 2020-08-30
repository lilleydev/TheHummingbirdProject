Hummingbird Project Skeleton

User

- has_many :created_projects, through: :user_project
- has_many :roles
- has_many :reviews, through projects
- Attributes: username, email, password_digest

User_Project

- belongs_to :user
- belongs_to :project

Project

- has_many :users, through: :user_project
- has_many :user_projects
- has_many :reviews
- belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

Roles (will be added with Rolify)

-

User_Role (rolify will add??)

- belongs_to :user
- belongs_to :role

Reviews

- belongs_to :project
- belongs_to :user
