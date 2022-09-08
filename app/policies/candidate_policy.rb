# frozen_string_literal: true

class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    (@user.voter? && check_in_candidate_table?)
  end

  def update?
    @user.admin?
  end

  def check_in_candidate_table?
    !Candidate.find_by(user_id: @user.id)
  end

  def create?
    @user.voter?
  end

  # def authorization_check
  #   return if params[:user_id] == current_user.id.to_s || current_user.admin?
  # end
end
