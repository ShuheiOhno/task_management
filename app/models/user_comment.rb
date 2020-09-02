class UserComment < ApplicationRecord
  belongs_to :user, optional: true
end
