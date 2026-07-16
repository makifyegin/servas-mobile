module Api
  class CountriesController < Api::ApiController
  def index
    @countries = Country.all
    render json: @countries
  end

  def show
    country = Country.find(params[:id])
    render json: country
  end
  end
end
