class FamiliesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_family, only: [:show]

  def index
    if params[:search].present?
      search = search_params.select {|key,value| value != ""}
      @families = Family.where(search)
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
