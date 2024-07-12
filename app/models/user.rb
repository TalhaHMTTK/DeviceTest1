class User < ApplicationRecord
  include Tenantable

  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  belongs_to :company
  has_many :customers
  has_many :tests
  
  
  enum role: { tester: 0, admin: 1 }
  
  accepts_nested_attributes_for :company

  def is_admin?
    role == "admin"
  end

  def is_tester?
    role == "tester"
  end

  def is_super_admin?
    super_admin == true
  end
end
