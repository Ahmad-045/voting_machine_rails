# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # %i[index? show_voters? destroy?].each do |name|
  #   define_method name do
  #     @user.admin?
  #   end
  # end

  def index?
    @user.admin?
  end

  alias destroy? index?
  alias show_voters? index?

  # alias_method :show_voter?
  def halka_voters?
    @user.candidate?
  end
end
