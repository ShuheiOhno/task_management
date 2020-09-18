class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_many :projects,through: :join_project_users ,dependent: :destroy
  has_many :project_comments, dependent: :destroy
  has_many :task_comments, dependent: :destroy
  has_many :user_comments, dependent: :destroy  
  has_many :reply_user_comments, dependent: :destroy
  has_one :comment
end
