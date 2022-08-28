class HomeController < ApplicationController

  def index
    @candidates = Halka.find(current_user.halka_id).users.candidate
  end

end
