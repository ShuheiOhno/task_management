class ProjectComment < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :comment, presence: true
  validates :to_user_id, presence: true
end
