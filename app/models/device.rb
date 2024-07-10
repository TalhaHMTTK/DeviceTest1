class Device < ApplicationRecord
  belongs_to :location
  has_many :test
  acts_as_tenant(:company)
end
