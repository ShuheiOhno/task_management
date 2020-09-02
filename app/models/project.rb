class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :users
  has_many :project_comments, dependent: :destroy
end
