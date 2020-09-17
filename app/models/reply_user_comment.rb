class ReplyUserComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_comment

  validates :reply, presence: true
end
