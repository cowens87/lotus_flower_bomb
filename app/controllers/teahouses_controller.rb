class TeahousesController < ApplicationController
  def index
    if params[:sort]
      @teahouses = Teahouse.sort_by_tea_count
    elsif params[:match]
      @teahouses = Teahouse.exact_match(params[:match])
    elsif params[:par_match]
      @teahouses = Teahouse.par_match(params[:par_match])
    else
      @teahouses = Teahouse.all
    end
  end

  def show
    @teahouse = Teahouse.find(params[:id])
  end

  def new
  end

  def create
    teahouse = Teahouse.create!(teahouse_params)
    if teahouse.save
      redirect_to teahouses_path
    else
      flash.now[:notice]= "Please Complete All Fields"
      render :new
    end
  end

  def edit
    @teahouse = Teahouse.find(params[:id])
  end

  def update
    teahouse = Teahouse.find(params[:id])
    teahouse.update(teahouse_params)
    teahouse.save
    redirect_to teahouse_path(teahouse.id)
  end

  def destroy
    Teahouse.destroy(params[:id])
    redirect_to teahouses_path
  end

  private

  def teahouse_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end 