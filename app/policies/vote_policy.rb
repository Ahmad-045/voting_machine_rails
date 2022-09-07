# frozen_string_literal: true

class VotePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    @user.admin? || election_closed?
  end

  def election_closed?
    Election.last.end_time.to_datetime <= Time.zone.now.localtime.strftime('%a, %d %b %Y %H:%M:%S')
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
