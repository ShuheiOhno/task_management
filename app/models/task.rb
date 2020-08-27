class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project, optional: true
  # belongs_to :complete, optional: true
end
