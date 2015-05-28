class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  has_many :observations
  has_many :photos, through: :observations
  has_and_belongs_to_many :ogrgeojsons
  
  validates :password, length: { minimum: 1 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  def add_region(ogrgeojson_id)
    unless self.ogrgeojsons.where(id: ogrgeojson_id).count != 0
      self.ogrgeojsons << Ogrgeojson.find(ogrgeojson_id)
    end
  end

  def remove_region(ogrgeojson_id)
    unless self.ogrgeojsons.where(id: ogrgeojson_id).count == 0
      self.ogrgeojsons.delete(ogrgeojson_id)
    end
  end
end
