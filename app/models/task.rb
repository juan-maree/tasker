class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  has_many :task_tags
  has_many :tags, through: :task_tags

  after_commit :create_tags, on: :create

  private

  def create_tags
    extract_description_tags.each do |name|
      tags.find_or_create_by(name: name)
    end
  end

  def extract_description_tags
    description.to_s.scan(/#\w+/).map { |name| name.gsub("#", "") }
  end
end
