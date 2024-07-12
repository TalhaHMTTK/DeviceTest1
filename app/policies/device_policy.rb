class DevicePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      end
    end
  end

  def edit?
    device_belongs_to_user? || user.admin?
  end

  def update?
    device_belongs_to_user? || user.admin?
  end

  def show?
    device_belongs_to_user? || user.admin?
  end

  def create?
    device_belongs_to_user?
  end

  private

  def device_belongs_to_user?
    record.location.customer.user == user
  end

end
