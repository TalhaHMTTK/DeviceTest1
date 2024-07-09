class CompanyPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope

    def resolve
      if user.is_super_admin?
        scope.all
      else
        user.where(id: user.company_id)
      end
    end
  end

  def show?
    (user.is_admin? && record.id == user.company_id) || user.is_super_admin?
  end

  def edit?
    user.is_admin? && record.id == user.company_id  
  end

  def index?
    user.is_super_admin?
  end
end
