class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    @user.voter? && check_in_candidate_table?
  end

  def check_in_candidate_table?
    Candidate.find_by(user_id: @user.id) ? false : true
  end

  def create?
    @user.voter?
  end

end
