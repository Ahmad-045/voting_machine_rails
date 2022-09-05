# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @users = filter_resources(params[:filter])

    @filter = params[:filter]
    authorize @users
  end

  def show
    if does_user_exist?
      @candidate = Candidate.find_by(user_id: params[:id])
      @user = Candidate.user_details(@candidate.user_id)[0]
    else
      redirect_to users_path, alert: 'Resource Not Found'
    end
  end

  def destroy
    if User.exists?(params[:id])
      User.destroy(params[:id])
      flash[:notice] = 'Successfully delete the User from the Database'
      redirect_to(request.referer || root_path)
    else
      redirect_to halka_path, alert: 'Error Deleting the User from the Database'
    end
  end

  def halka_voters
    @users = User.where(halka_id: current_user.halka_id).page(params[:page]).per(10)
  end

  def show_voters
    @votes = Candidate.find(params[:id]).votes
  end

  private

  def does_user_exist?
    Candidate.find_by(user_id: params[:id])
  end

  def filter_resources(filter)
    case filter
    when 'Voters'
      User.page(params[:page]).per(10)
    else
      Candidate.user_details(Candidate.pluck(:user_id))
    end
  end
end
