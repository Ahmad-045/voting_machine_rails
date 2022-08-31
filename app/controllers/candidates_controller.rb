class CandidatesController < ApplicationController

  before_action :authorization_check

  def new
    @candidate = Candidate.new
    authorize @candidate
  end

  def create
    @candidate = Candidate.new(set_params)
    authorize @candidate

    @candidate.user_id = current_user.id
    @candidate.halka_id = current_user.halka_id

    if @candidate.save
      redirect_to root_path, notice: 'Congrats! successfully applied for Candidate-Ship'
    else
      redirect_to user_candidate_path, alert: 'The Party Name cannot be empty'
    end
  end

  def update

    candidate_status = Candidate.find_by(user_id: params[:user_id])
    candidate_status.toggle!(:approved)

    if toggle_user_role(params[:user_id])
      redirect_to users_path, notice: 'Successfully, Updated the Candidate Status'
    else
      flash[:alert] = 'Error while updating the Candidate Status'
    end
  end

  def votes
    @candidates = Candidate.all
  end

  private

  def set_params
    params.require(:candidate).permit(:party_name, :party_symbol)
  end

  def toggle_user_role(user_id)
    user = User.find_by(id: user_id)
    if user.voter?
      user.candidate!
    elsif user.candidate?
      user.voter!
    end
  end

  def authorization_check
    if params[:user_id] != current_user.id.to_s
      if !current_user.admin?
        redirect_to root_path, alert: 'Not Authorized For this action'
      end
    end
  end

end
