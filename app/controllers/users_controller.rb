class UsersController < ApplicationController

  def index
    @users = User.all
    if params[:filter].present? && params[:filter] == 'Voters'
      @users = User.all
    else
      @users = User.candidate
    end

    respond_to do |format|
      format.js { render partial: 'users/results'}
      format.html { }
    end

    authorize @users
  end

end
