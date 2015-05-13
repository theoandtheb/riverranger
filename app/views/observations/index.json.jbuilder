json.array!(@observations) do |observation|
  json.extract! observation, :id, :description, :comment, :coordinates
  json.url observation_url(observation, format: :json)
end
