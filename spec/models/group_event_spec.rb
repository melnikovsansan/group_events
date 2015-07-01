require 'rails_helper'

RSpec.describe GroupEvent, type: :model do

  before(:each) do
    @group_event = GroupEvent.new(started_on: Date.current)
  end

  it 'set finish_on use started_on and duration' do
    @group_event.duration = 3
    expect(@group_event.finished_on).to eq(Date.current + 2.day)
  end

  it 'get duration use finish_on and started_on' do
    @group_event.finished_on = Date.current + 2.day
    expect(@group_event.duration).to eq(3)
  end

end
