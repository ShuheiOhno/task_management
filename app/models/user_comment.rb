class UserComment < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reply_user_comments, dependent: :destroy

  validates :title, presence: true
  validates :comment, presence: true
  validates :to_user_id, presence: true
end
