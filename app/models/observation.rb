class Observation < ActiveRecord::Base
	belongs_to :user
	has_many :bools
	has_many :documents
	has_many :photos
	has_many :studies
	has_many :tests

	accepts_nested_attributes_for :bools, reject_if: :all_blank
	accepts_nested_attributes_for :documents, reject_if: :all_blank
	accepts_nested_attributes_for :photos, reject_if: :all_blank
	accepts_nested_attributes_for :studies, reject_if: :all_blank
	accepts_nested_attributes_for :tests, reject_if: :all_blank

  def coordinates_x
    self.coordinates.x
  end

  def coordinates_y
    self.coordinates.y
  end
end
