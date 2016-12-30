class Position < ApplicationRecord
  belongs_to :rental
  validates :rental_id, presence: true
  validates :timestamp, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end
