json.array!(@labour_availabilities) do |labour_availability|
  json.extract! labour_availability, :id, :month, :day, :labour_id, :utilized
  json.url labour_availability_url(labour_availability, format: :json)
end
