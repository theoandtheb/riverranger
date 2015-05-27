require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first_name: "River", last_name: "Ranger", username: "River Ranger", email: "riverrangersca@gmail.com", password: "que", password_confirmation: "que")
user.activate!

if Rails.env.production?
    (1..22).each do |j|
        l = "#{j.to_s}.json"
        system("ogr2ogr -f \"PostgreSQL\" PG:\"dbname=riverranger_production user=deploy\" #{l} -nln ogrgeojsons -append")
    end
else
    (1..22).each do |j|
        l = "#{j.to_s}.json"
        system("ogr2ogr -f \"PostgreSQL\" PG:\"dbname=riverranger_gis user=postgres\" #{l} -nln ogrgeojsons -append")
    end
end

CSV.foreach(File.join(Rails.root, "seedObs.csv"), :headers => true, :encoding => 'UTF-8') do |row|
observation = Observation.create([{
    comment: row[1],
    coordinates: RGeo::Geographic.spherical_factory(srid: 4326).point(row[8], row[7]),
    user_id: row[3],
    loc_nic: row[4],
    observe_on: row[5]
  }])
end

CSV.foreach(File.join(Rails.root, "seedTests.csv"), :headers => true, :encoding => 'UTF-8') do |row|
observation = Test.create([{
    ph: row[0],
    temperature: row[1],
    phosphate: row[2],
    clarity: row[3],
    oxygen: row[4],
    nitri: row[5],
    nitrate: row[6],
    observation_id: row[8]
  }])
end

@observations = Observation.all
@observations.each do |o|
    o.region_matches
end

# CSV.foreach(File.join(Rails.root, "regions.csv"), :headers => true, :encoding => 'UTF-8') do |row|
# ogrgeojson = Ogrgeojson.create([{
#     name: row[0],
#     wkb_geometry: RGeo::Geographic.spherical_factory(srid: 4326).parse_wkt(row[1])
#   }])
# end


# observation = Observation.create([{
#     description: "First Observation",
#     coordinates: RGeo::Geographic.spherical_factory(srid: 4326).point(51.5033630, -0.1276250),
#     comment: "Well, this is our first observation"
#   }])

# document = Document.create([{
#     document_file_name: "first.pdf",
#     document_content_type: 'application/pdf',
#     document_file_size: 398961,
#     document_updated_at: "2014-03-28 13:22:45",
#     observation_id: 1
#   }])

# photo = Photo.create([{
#     image_file_name: "first.png",
#     image_content_type: "image/png",
#     image_file_size: 398961,
#     image_updated_at: "2014-03-28 13:22:45",
#     observation_id: 1
#   }])

# study = Study.create([{
#     title: "First Observation",
#     author: "Steve Zissou",
#     abstract: "I sought the Jaguar Shark that ate my best friend and planned to kill it.",
#     url: "http://en.wikipedia.org/wiki/The_Life_Aquatic_with_Steve_Zissou",
#     observation_id: 1
#   }])