class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project, optional: true
  has_one :start_time
  has_one :stop_time
  has_many :task_comment,dependent: :destroy
  # belongs_to :complete, optional: true
end
