json.array!(@parts) do |part|
  json.extract! part, :id, :part_id, :rate, :std_people
  json.url part_url(part, format: :json)
end
