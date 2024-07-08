class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  has_many :customers
  has_many :tests
  accepts_nested_attributes_for :company
  
end
