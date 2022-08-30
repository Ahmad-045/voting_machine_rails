class HomeController < ApplicationController

  def index
    @candidates = Halka.find(current_user.halka_id).users.candidate
    @election_end_time = Election.last.end_time
  end

end
