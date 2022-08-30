class VoteController < ApplicationController

  def add

    if election_opened?
      candidate = Candidate.find_by(user_id: params[:id])
      vote = Vote.new(user_id: current_user.id, candidate_id: candidate.id)

      if User.find(current_user.id).given_vote == false
        update_user_status(current_user.id)
        vote.save
        redirect_to root_path, notice: 'Successfully casted your vote'
      else
        redirect_to root_path, alert: 'CANNOT VOTE NOW, because you have already Casted a Vote'
      end
    else
      redirect_to root_path, alert: "Voting Time is over, CANNOT VOTE NOW"
    end

  end

  private

  def update_user_status(id)
    user = User.find(id)
    user.given_vote = true
    user.save
  end

  def election_opened?
    true
    # zone = 'Islamabad'
    # puts ActiveSupport::TimeZone[zone].parse(Election.last.end_time)
    # byebug
    # if Time.zone.now >= Election.last.end_time
    #   true
    # else
    #   false
    # end
  end

end
