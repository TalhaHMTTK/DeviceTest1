class Customer < ApplicationRecord
  include Tenantable
  belongs_to :user
  has_many :locations
end
