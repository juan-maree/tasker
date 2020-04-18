class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks

  def tasks_by_status(status)
    self.tasks.where(status: status)
  end
end
