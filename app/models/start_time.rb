class StartTime < ApplicationRecord
  belongs_to :task, optional: true
end
