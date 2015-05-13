json.array!(@studies) do |study|
  json.extract! study, :id, :title, :author, :abstract, :url, :observation_id
  json.url study_url(study, format: :json)
end
