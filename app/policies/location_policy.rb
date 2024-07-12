class LocationPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:customer).where(customers: { user_id: user.id })
      end
    end
  end

  def device_index?
    user_owns_customer? || user.admin?
  end

  def device_new?
    user_owns_customer?
  end

  def edit?
    user_owns_customer? || user.admin?
  end

  def update?
    user_owns_customer? || user.admin?
  end

  def create?
    user_owns_customer?
  end

  def show?
    user_owns_customer? || user.admin?
  end

  private

  def user_owns_customer?
    record.customer.user == user
  end
end
