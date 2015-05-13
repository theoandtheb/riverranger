json.array!(@photos) do |photo|
  json.extract! photo, :id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :observation_id
  json.url photo_url(photo, format: :json)
end
