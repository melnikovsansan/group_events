class GroupEvent < ActiveRecord::Base
  attr_reader :duration
  default_scope { where deleted_at: nil}

  publishable on: :published_at

  with_options if: :published? do |published_group_event|
    published_group_event.validates :name, :description, :location, presence: true
    published_group_event.validates :started_on, date: true
    published_group_event.validates :finished_on, date: { after_or_equal_to: :started_on }
  end

  after_initialize :set_duration, :set_finished_on

  def duration=(val)
    @duration = val.to_i if val.to_i > 0
    set_finished_on
  end

  def finished_on=(val)
    super
    set_duration
  end

  def self.deleted
    unscoped.where.not deleted_at: nil
  end

  private

  def set_finished_on
    self.finished_on ||= started_on + (duration - 1).day rescue nil
  end

  def set_duration
    self.duration = (finished_on - started_on).to_i + 1 rescue nil
  end

end
