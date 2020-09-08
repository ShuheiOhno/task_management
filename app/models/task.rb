class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project, optional: true
  belongs_to :start_time, optional: true
  belongs_to :stop_time, optional: true
  has_many :task_comment,dependent: :destroy
  # belongs_to :complete, optional: true
end
