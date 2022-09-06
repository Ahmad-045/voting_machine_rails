# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :authorization_check

  def new
    @candidate = Candidate.new
    authorize @candidate
  end

  def create
    @candidate = Candidate.new(candiate_params)
    authorize @candidate

    @candidate.user_id = current_user.id
    @candidate.halka_id = current_user.halka_id

    if @candidate.save
      redirect_to root_path, notice: 'Congrats! successfully applied for Candidate-Ship. Wait for aproval from ADMIN'
    else
      redirect_to user_candidate_path, alert: 'The Party Name cannot be empty'
    end
  end

  def update
    candidate_status = Candidate.find_by(user_id: params[:user_id])

    if toggle_user_role(params[:user_id], candidate_status)
      redirect_to users_path, notice: 'Successfully, Updated the Candidate Status'
    else
      flash[:alert] = 'Error while updating the Candidate Status'
    end
  end

  private

  def candiate_params
    params.require(:candidate).permit(:party_name, :party_symbol)
  end

  def toggle_user_role(user_id, candidate_status)
    user = User.find_by(id: user_id)
    if user.voter?
      user.candidate!
      candidate_status.approved = true

    elsif user.candidate?
      user.voter!
      candidate_status.approved = false
    end
    check_fail_save(candidate_status)
  end

  def check_fail_save(record)
    return true if record.save

    redirect_to root_path, alert: 'Error Saving the Record in the Database...'
  end

  def authorization_check
    return if params[:user_id] == current_user.id.to_s || current_user.admin?

    redirect_to root_path, alert: 'Not Authorized For this action'
  end
end
