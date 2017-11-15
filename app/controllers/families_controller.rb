class FamiliesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_family, only: [:show]

  def index
    raise
    @families = Family.all
    @country_origin = params[:country_origin]
    if @country_origin.present?
      @families = Family.where(country_origin: @country_origin)
    else
      @families = Family.all
    end
  end

  def show
    @booking = Booking.new
  end

  private

  def find_family
    @family = Family.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:country_origin, :name)
  end

end
