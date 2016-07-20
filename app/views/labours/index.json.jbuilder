json.array!(@labours) do |labour|
  json.extract! labour, :id, :employee_id, :name
  json.url labour_url(labour, format: :json)
end
