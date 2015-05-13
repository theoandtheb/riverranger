json.array!(@documents) do |document|
  json.extract! document, :id, :document_file_name, :document_content_type, :document_file_size, :document_updated_at, :observation_id
  json.url document_url(document, format: :json)
end
