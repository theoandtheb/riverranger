require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach(File.join(Rails.root, "seedObs.csv"), :headers => true, :encoding => 'UTF-8') do |row|
observation = Observation.create([{
    comment: row[1],
    coordinates: RGeo::Geographic.spherical_factory(srid: 4326).point(row[7], row[8]),
    user_id: row[3],
    loc_nic: row[4],
    observe_on: row[5]
  }])
end






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