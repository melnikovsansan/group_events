json.array!(@group_events) do |group_event|
  json.extract! group_event, :id, :started_on, :finished_on, :duration, :name, :description, :location, :published_at
end
