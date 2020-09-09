class UserComment < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reply_user_comments, dependent: :destroy
end
