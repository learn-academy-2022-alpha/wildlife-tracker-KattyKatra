class AnimalController < ApplicationController
  def index
    animals = Animal.all
    render json: animals
  end
  def show
    animal = Animal.find(params[:id])
    render json: animal
  end
  def create
    animal = Animal.create(strong_animal_params)
  end
  def update
    animal = Animal.find(params[:id])
    animal.update(strong_animal_params)
  end
  def destroy
    animal = Animal.find(params[:id])
    if single_sighting.destroy
      render json: animal
    else
      render json: animal.errors
    end
  end
  private
  def strong_animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
  end
end
