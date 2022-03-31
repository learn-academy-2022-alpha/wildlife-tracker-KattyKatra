class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
  def show
    single_sighting = Sighting.find(params[:id])
    render json: single_sighting
  end
  def create
    new_sighting = Sighting.create(sighting_params)
    if new_sighting.valid?
      render json: new_sighting
    else
      render json: new_sighting.errors
    end
  end
  def update
    single_sighting = Sighting.find(params[:id])
    single_sighting.update(sighting_params)
    if single_sighting.valid?
      render json: single_sighting
    else
      render json: single_sighting.errors
    end
  end
  def destroy
    single_sighting = Sighting.find(params[:id])
    if single_sighting.destroy
      render json: single_sighting
    else
      render json: single_sighting.errors
    end
  end
  def sighting_params
    params.require(:sighting).permit(:date, :longitude, :latitude, :animal_id)
  end
end
