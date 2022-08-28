class VoteController < ApplicationController
  def add
    candidate = Candidate.find_by(user_id: params[:id])
    vote = Vote.new(user_id: current_user.id, candidate_id: candidate.id)


    if User.find(current_user.id).given_vote == false
      update_user_status(current_user.id)
      redirect_to root_path, notice: 'Successfully casted your vote'
    else
      redirect_to root_path, alert: 'CANNOT VOTE NOW, because you have already Casted a Vote'
    end

  end

  private

  def update_user_status(id)
    user = User.find(id)
    user.given_vote = true
    user.save
  end

end
