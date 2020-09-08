class JoinProjectUser < ApplicationRecord
  belongs_to :project

  # したが怪しい
  belongs_to :user
end
