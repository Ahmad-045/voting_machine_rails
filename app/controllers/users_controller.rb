class UsersController < ApplicationController

  def index
    @users = User.all
    if !params[:filter] || (params[:filter].present? && params[:filter] == 'Voters')
      @users = User.all
    elsif params[:filter] == 'Candidate'
      @users = Candidate.user_details(Candidate.pluck(:user_id))
    end
    @filter = params[:filter]
    authorize @users
  end

  def show
    candidate = Candidate.find_by(user_id: params[:id])
    @user = Candidate.user_details(candidate.user_id)[0]
  end

end
