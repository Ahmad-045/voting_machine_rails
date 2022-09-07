class VotePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def add?
    candidate_halka == user_halka
  end

  def candidate_halka
    Candidate.find_by(id: @record.candidate_id).halka_id
  end

  def user_halka
    @user.halka_id
  end
end
