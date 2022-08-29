class UsersController < ApplicationController

  def index
    @users = User.all
    if params[:filter].present? && params[:filter] == 'Voters'
      @users = User.page(params[:page]).per(10)
    elsif !params[:filter] || params[:filter] == 'Candidate'
      @users = Candidate.user_details(Candidate.pluck(:user_id))
    end
    @filter = params[:filter]
    authorize @users
  end

  def show
    candidate = Candidate.find_by(user_id: params[:id])
    @user = Candidate.user_details(candidate.user_id)[0]
  end

  def halka_voters
    @users = User.where(halka_id: current_user.halka_id).page(params[:page]).per(10)

  end

  def show_voters
    @votes = Candidate.find(params[:id]).votes
  end

end
