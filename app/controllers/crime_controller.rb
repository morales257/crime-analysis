class CrimeController < ApplicationController
  def index
    @crimes = Crime.all

    render json: @crimes
  end

  def new
    @crime = Crime.new
  end

  def create
    @crime = Crime.new(crime_params)

    respond_to do |format|
        format.html
        format.json
    end
  end

  def update
  end

  def destroy
  end

  private

  def crime_params
    params.require(:crime).permit(:objid, :time, :district, :type, :streets, :longitude, :latitude)
  end
end
