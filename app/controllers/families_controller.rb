class FamiliesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_family, only: [:show]

  def index
    @families = Family.all
    # @category = params[:category]
    # if @category.present?
    #   @families = Family.where(category: @category)
    # else
    #   @families = Family.all
    # end
  end

  def show
    @booking = Booking.new
  end

  private

  def find_family
    @family = Family.find(params[:id])
  end

end
