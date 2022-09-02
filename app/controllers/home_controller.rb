# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @candidates = Halka.find(current_user.halka_id).users.candidate
    return unless Election.all.count.positive?

    @election_end_time = Election.last.end_time
  end
end
