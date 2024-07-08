class Location < ApplicationRecord
  belongs_to :customer
  has_many :devices
end
