class Customer < ApplicationRecord
  belongs_to :user
  has_many :locations
  acts_as_tenant(:company)
end
