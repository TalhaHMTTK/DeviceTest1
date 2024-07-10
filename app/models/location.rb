class Location < ApplicationRecord
  belongs_to :customer
  has_many :devices
  acts_as_tenant(:company)
end
