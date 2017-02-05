class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.paginate(page: params[:page])
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @crimes = @neighborhood.crimes

    render json: @crimes
  end
end
