# frozen_string_literal: true

class HalkaPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  %i[new? index? create?].each do |name|
    define_method name do
      @user.admin?
    end
  end

  # def new?
  #   @user.admin?
  # end

  # def index?
  #   new?
  # end

  # def create?
  #   new?
  # end
end
