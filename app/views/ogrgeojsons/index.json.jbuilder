json.array!(@ogrgeojsons) do |ogrgeojson|
  json.extract! ogrgeojson, :id, :name, :wkb_geometry
  json.url ogrgeojson_url(ogrgeojson, format: :json)
end
