class FamiliesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :index_filtered]
  before_action :find_family, only: [:show]

  def index
    @countries_list = array_countries

    if params[:search].present?
      search = search_params.select {|key,value| value != ""}
      @families = Family.where(search)
    elsif params[:clicked_country].present?
      @families = Family.where(country_origin: @clicked_country)
    else
      @families = Family.all
    end
  end


  def show
    @booking = Booking.new
    @flat_coordinates = { lat: @family.latitude, lng: @family.longitude }
  end

  private

  def array_countries
    countries = [['Country', '# Families']]
    countries_uniq = Family.all.map(&:country_origin).uniq
    countries_uniq.each do |country|
      countries_nb = Family.where(country_origin: country).count
      countries << [country, countries_nb]
    end
    countries
  end

  def find_family
    @family = Family.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:country_origin, :name)
  end
end
