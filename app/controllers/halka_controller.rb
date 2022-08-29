class HalkaController < ApplicationController

  def index
    @halkas = Halka.page(params[:page]).per(10)
  end

  def new
    @halka = Halka.new
  end

  def create

    @halka = Halka.new(set_params)

    if @halka.save
      redirect_to halka_index_path, notice: "Succesfully added new Halka"
    else
      redirect_to new_halka_path, alert: "Error Creating new Halka"
    end

  end

  private

  def set_params
    params.require(:halka).permit(:name)
  end
end
