# frozen_string_literal: true

class VoteController < ApplicationController
  def add
    if election_opened? && candidate_aprroved?
      candidate = Candidate.find_by(user_id: params[:id])

      if User.find(current_user.id).given_vote
        redirect_to root_path, alert: 'CANNOT VOTE NOW, because you have already Casted a Vote'
      else
        vote = Vote.new(user_id: current_user.id, candidate_id: candidate.id)
        update_user_status(current_user.id)
        vote.save
        redirect_to root_path, notice: 'Successfully casted your vote'
      end
    else
      redirect_to root_path, alert: 'CANNOT VOTE RIGHT NOW'
    end
  end

  private

  def update_user_status(id)
    user = User.find(id)
    user.given_vote = true
    user.save
  end

  def election_opened?
    Election.last.end_time.to_datetime >= Time.zone.now.localtime.strftime('%a, %d %b %Y %H:%M:%S')
  end

  def candidate_aprroved?
    Candidate.find_by(user_id: params[:id]).approved
  end
end
