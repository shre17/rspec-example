class Product < ApplicationRecord
  include Filterable
  belongs_to :location, optional: true
  scope :status, -> (status) { where status: status }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

  validates_presence_of :name, :status, :location_id, :price
end