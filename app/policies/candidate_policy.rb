class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    @user.voter?
  end

  def create?
    @user.voter?
  end

end
