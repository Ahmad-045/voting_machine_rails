class ElectionController < ApplicationController
  def new
    @election = Election.new
  end

  def create
    @election = Election.new(set_params)
    if @election.save
      redirect_to root_path, notice: "Successfully, created an Election Event"
    else
      redirect_to new_election_path, notice: 'Error, while creating the Election Event'
    end
  end

  private

  def set_params
    params.require(:election).permit(:start_time, :end_time)
  end

end
