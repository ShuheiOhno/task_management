class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :start_time,dependent: :destroy
  has_one :stop_time,dependent: :destroy
  has_many :task_comment,dependent: :destroy

  validates :title, presence: true
  validates :to_user_id, presence: true

  def self.search(search)
    if search != ""
      Task.where('title LIKE(?)', "%#{search}%")
    else
      Task.all
    end
  end

end
