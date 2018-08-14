class WallPolicy < ApplicationPolicy

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
