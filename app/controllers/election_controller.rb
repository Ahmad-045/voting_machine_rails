# frozen_string_literal: true

class ElectionController < ApplicationController
  def new
    @election = Election.new
    authorize @election
  end

  def create
    @election = Election.new(election_params)
    authorize @election
    if @election.save
      redirect_to root_path, notice: 'Successfully, created an Election Event'
    else
      redirect_to new_election_path,
                  alert: 'Error, while creating the Election Event. Either the field is empty or Its in the PAST'
    end
  end

  private

  def election_params
    params.require(:election).permit(:start_time, :end_time)
  end
end
