# frozen_string_literal: true

class HalkaController < ApplicationController
  def index
    @halkas = Halka.page(params[:page]).per(10)
    authorize @halkas
  end

  def new
    @halka = Halka.new
    authorize @halka
  end

  def create
    @halka = Halka.new(halka_params)
    authorize @halka
    if @halka.save
      redirect_to halka_index_path, notice: 'Succesfully added new Halka'
    else
      redirect_to new_halka_path, alert: 'Error Creating new Halka'
    end
  end

  def destroy
    if Halka.exists?(params[:id])
      Halka.destroy(params[:id])
      flash[:notice] = 'Successfully delete the Halka from the Database'
      redirect_to(request.referer || root_path)
    else
      redirect_to halka_path, alert: 'Error Deleting the Halka from the Database'
    end
  end

  private

  def halka_params
    params.require(:halka).permit(:name)
  end
end
