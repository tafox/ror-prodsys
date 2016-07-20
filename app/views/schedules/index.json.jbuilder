json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :start, :end, :labour_id, :machine_id
  json.url schedule_url(schedule, format: :json)
end
