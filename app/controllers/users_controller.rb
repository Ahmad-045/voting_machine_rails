# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users

    @users = filter_resources(params[:filter])
    @filter = params[:filter]
  end

  def show
    @candidate = Candidate.find_by(user_id: params[:id])

    if @candidate
      @user = Candidate.user_details(@candidate.user_id).take
    else
      redirect_to users_path, alert: 'Resource Not Found'
    end
  end

  def destroy
    authorize User
    @user = User.find_by(id: params[:id])

    if @user
      check_in_candidate_table(@user.id)
      User.destroy(params[:id])
      redirect_to request.referer || root_path, notice: 'Successfully delete the User from the Database'
    else
      redirect_to halka_path, alert: 'Error Deleting the User from the Database'
    end
  end

  def halka_voters
    @users = User.where(halka_id: current_user.halka_id).page(params[:page]).per(10)
    authorize @users
  end

  def show_voters
    @votes = Candidate.find_by(id: params[:id])&.votes

    authorize current_user
  end

  private

  def filter_resources(filter)
    case filter
    when 'Voters'
      User.page(params[:page]).per(10)
    else
      Candidate.user_details(Candidate.pluck(:user_id))
    end
  end

  def check_in_candidate_table(user_id)
    @candidate = Candidate.find_by(user_id: user_id)
    @candidate&.destroy
  end
end
