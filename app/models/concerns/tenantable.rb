module Tenantable
  extend ActiveSupport::Concern
  
  included do 
    acts_as_tenant(:company)
  end
end
