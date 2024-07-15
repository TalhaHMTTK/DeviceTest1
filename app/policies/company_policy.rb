class CompanyPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope

    def resolve
      if user.super_admin?
        scope.all
      else
        scope.where(id: user.company_id)
      end
    end
  end

  def show?
    (user.admin? && record.id == user.company_id) || user.super_admin?
  end

  def edit?
    user.admin? && record.id == user.company_id  
  end

  def index?
    user.super_admin?
  end
end
