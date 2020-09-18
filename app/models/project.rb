class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :project_comments, dependent: :destroy
  has_many :join_project_users, dependent: :destroy

  has_many :users,through: :join_project_users , dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :complete

  validates :title, presence: true
  validates :explanation, presence: true
  validates :deadline, presence: true

  def self.search(search)
    if search != ""
      Project.where('title LIKE(?)', "%#{search}%")
    else
      Project.all
    end
  end

end
