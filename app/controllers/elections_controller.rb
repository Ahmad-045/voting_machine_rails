class ElectionsController < ApplicationController
  def new
    @election = Election.new
  end

  def create
    @election = Election.new(set_params)
  end

  private

  def set_params
    params.require(:election).permit(:start_time, :end_time)
  end

end
