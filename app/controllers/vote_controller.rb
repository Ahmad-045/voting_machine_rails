# frozen_string_literal: true

class VoteController < ApplicationController
  def index
    @vote = Vote.all
    @candidate_information = Candidate.includes(:votes)
  end

  def add
    if election_opened? && candidate_aprroved?
      candidate = Candidate.find_by(user_id: params[:id])
      vote = Vote.new(user_id: current_user.id, candidate_id: candidate.id)
      vote.save
      redirect_to root_path, notice: 'Successfully casted your vote'
    else
      redirect_to root_path, alert: 'CANNOT VOTE, Either you have already casted your vote or Election is not Started Yet'
    end
  end

  private

  def election_opened?
    Election.last.end_time.to_datetime >= Time.zone.now.localtime.strftime('%a, %d %b %Y %H:%M:%S')
  end

  def candidate_aprroved?
    return flash[:alert] = 'Not Authorized/Approved Yet' unless Candidate.exists?(user_id: params[:id])

    Candidate.find_by(user_id: params[:id]).approved && !current_user.given_vote
  end
end
