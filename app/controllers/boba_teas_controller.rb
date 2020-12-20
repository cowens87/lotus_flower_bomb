class BobaTeasController < ApplicationController
  def index
    @boba_teas = BobaTea.all
  end

  def show
    @boba_tea = BobaTea.find(params[:id])
  end

  def edit
    @boba_tea = BobaTea.find(params[:id])
  end

  def update
    boba_tea = BobaTea.find(params[:id])
    boba_tea.update(boba_params)
    boba_tea.save
    redirect_to boba_tea_path(boba_tea.id)
  end

  def destroy
    BobaTea.destroy(params[:id])
    redirect_to boba_teas_path
  end

  private

  def boba_params
    params.permit(:name, :price, :base, :caffeinated, :description)
  end

end