class FamiliesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_family, only: [:show]

  def index
    @category = params[:category]
    if @category.present?
      @families = Family.where(category: @category)
    else
      @families = Family.all
    end
  end

  def show
  end

  private

  def find_family
    @family = Family.find(params[:id])
  end

end
