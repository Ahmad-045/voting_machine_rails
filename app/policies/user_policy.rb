# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  %i[index? show_voters?].each do |name|
    define_method name do
      @user.admin?
    end
  end
  # def index?
  #   @user.admin?
  # end

  # def show_voters?
  #   @user.admin?
  # end

  def halka_voters?
    @user.candidate?
  end
end
