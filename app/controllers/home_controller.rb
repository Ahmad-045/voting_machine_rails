class HomeController < ApplicationController

  def index
    @candidates = Halka.find(current_user.halka_id).users.candidate
    if Election.all.count > 0
      @election_end_time = Election.last.end_time
    end
  end

end
