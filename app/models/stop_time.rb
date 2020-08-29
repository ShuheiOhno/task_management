class StopTime < ApplicationRecord
  belongs_to :task, optional: true
end
