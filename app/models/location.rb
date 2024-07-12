class Location < ApplicationRecord
  include Tenantable
  belongs_to :customer
  has_many :devices
end
