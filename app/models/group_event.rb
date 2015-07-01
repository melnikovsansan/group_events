class GroupEvent < ActiveRecord::Base
  default_scope { where deleted_at: nil}

  publishable on: :published_at

  with_options if: :published? do |published_group_event|
    published_group_event.validates :name, :description, :location, presence: true
    published_group_event.validates :started_on, date: true
    published_group_event.validates :finished_on, date: true
  end

  validates :duration, numericality: { allow_blank: true, greater_than_or_equal_to: 1 }

  def duration
    (finished_on - started_on).to_i + 1 rescue nil
  end

  def duration=(val)
    self.finished_on = started_on + (val.to_i - 1).day rescue nil
  end

  def self.deleted
    unscoped.where.not deleted_at: nil
  end

end
