class TeahouseBobaTeasController < ApplicationController
  #finds the teas associated to a specific teahouse
  def index
    @teahouse = Teahouse.find(params[:id])
    if params[:sort]
      @teas = Teahouse.find(params[:id]).boba_teas.alpha_sort
    else
      @teas = Teahouse.find(params[:id]).boba_teas
    end
  end

  def new
    @tea = Teahouse.find(params[:id])
  end

  def create
    tea = Teahouse.find(params[:id])
    tea.boba_teas.create!(boba_params)
    if tea.save
      redirect_to teahouse_boba_teas_path(tea.id)
    else 
      flash.now[:notice]= "Please Complete All Fields"
      render :new
    end
  end

  private

  def boba_params
    params.permit(:name, :price, :base, :caffeinated, :description)
  end
end