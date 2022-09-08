# frozen_string_literal: true

class HalkaController < ApplicationController
  def index
    authorize Halka
    @halkas = Halka.page(params[:page]).per(10)
  end

  def new
    authorize Halka
    @halka = Halka.new
  end

  def create
    authorize Halka
    @halka = Halka.new(halka_params)
    if @halka.save
      redirect_to halka_index_path, notice: 'Succesfully added new Halka'
    else
      redirect_to new_halka_path, alert: 'Error Creating new Halka'
    end
  end

  def destroy
    authorize Halka
    @halka = Halka.find_by(id: params[:id])

    if @halka && check_admin_halka(params[:id])
      @halka.destroy!
      redirect_to halka_index_path, notice: 'Successfully delete the Halka from the Database'
    else
      redirect_to halka_index_path, alert: 'Error Deleting the Halka from the Database'
    end
  end

  private

  def halka_params
    params.require(:halka).permit(:name)
  end

  def check_admin_halka(halka_id)
    current_user.halka_id != halka_id.to_i
  end
end
