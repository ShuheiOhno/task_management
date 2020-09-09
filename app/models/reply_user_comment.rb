class ReplyUserComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_comment
end
