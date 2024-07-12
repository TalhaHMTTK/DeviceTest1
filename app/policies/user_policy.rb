class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        scope.none
      end
    end
  end

  def customer_index?
    user.admin? || record.id == user.id
  end

  def customer_new?
    record.id == user.id
  end

  def show_all_customer?
    user.admin?
  end

  def show?
    user.admin? || record.id == user.id
  end

  def edit?
    user.admin? || record.id == user.id
  end

  def update?
    user.admin? || record.id == user.id   
  end

  def index?
    user.admin?
  end
end
