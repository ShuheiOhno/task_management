class TaskComment < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :comment, presence: true
  validates :to_user_id, presence: true
end
