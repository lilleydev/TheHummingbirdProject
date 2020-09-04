Hummingbird Project Skeleton

User

- has_many :created_projects, through: :user_project
- has_many :roles
- has_many :reviews, through projects
- Attributes: username, email, password_digest, first name, last name, pronouns
- Additional fields: BIPOC; QTLGBT; Deaf/Hearing Interpreter; Special Skills: text_area; SSP Training/Experience

User_Project

- belongs_to :user
- belongs_to :project

Project

- has_many :users, through: :user_project
- has_many :user_projects
- has_many :reviews
- belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
- Attributes: description: text_area

Roles (will be added with Rolify)

-

User_Role (rolify will add??)

- belongs_to :user
- belongs_to :role

Reviews (Feedback)

- belongs_to :project
- belongs_to :user
- attributes: content:text_area (limit characters as a feature)

should be ignored\*
