class FamiliesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_family, only: [:show, :update, :destroy]

  def index
    if params[:search].present?
      search = search_params.select {|key,value| value != ""}
      @families = Family.where(search)
    else
      @families = Family.all
    end
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id
    if @family.save!
        redirect_to families_path(@family)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    #@family.update(family_params)
  end

  def destroy
    #@family.destroy
    #redirect_to families_path
  end

  private

  def find_family
    @family = Family.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:country_origin, :name)
  end

  def family_params
  params.require(:family).permit(:name, :country_origin, :city, :members, :pension, :churchgoer, :swinger, :photo, :price_per_day)
  end
end

