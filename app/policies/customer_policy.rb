class CustomerPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:user).where(users: { id: user.id })
      end
    end
  end

  def location_new?
    record.user_id == user.id
  end

  def location_index?
    user.id == record.user_id || user.admin?
  end

  def create?
    user.id == record.user_id
  end
  
  def edit?
    user.id == record.user_id || user.admin?
  end
  
  def update?
    user.id == record.user_id || user.admin?
  end

  def show?
    user.id == record.user_id || user.admin?
  end
end
