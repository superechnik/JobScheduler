json.array!(@jobs) do |job|
  json.extract! job, :id, :job_id, :priority, :quantity, :date_due, :part_id
  json.url job_url(job, format: :json)
end
