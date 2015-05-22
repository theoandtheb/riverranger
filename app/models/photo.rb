class Photo < ActiveRecord::Base
  belongs_to :observation
  
  has_attached_file :image, :styles => { :medium => "300x300>", :default_size => "800x450", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('default_observation_image.jpg')
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
