# frozen_string_literal: true

class ElectionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    @user.admin?
  end

  alias create? new?
end
