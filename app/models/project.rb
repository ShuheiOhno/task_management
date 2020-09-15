class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # has_many :users, through: :join_project_users
  has_many :project_comments, dependent: :destroy
  has_many :join_project_users, dependent: :destroy
  # has_many :task_comment,dependent: :destroy
 
  # 実験
  has_many :users,through: :join_project_users , dependent: :destroy

  def self.search(search)
    if search != ""
      Project.where('title LIKE(?)', "%#{search}%")
    else
      Project.all
    end
  end

end
