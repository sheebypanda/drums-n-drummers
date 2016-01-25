class DrummersController < ApplicationController
  def index
    @drummers = Drummer.all
  end

  def show
    @drummer = Drummer.find(params[:id])
  end

  def new
    @drummer = Drummer.new
  end

  def create
    drummer_params = params.require(:drummer).permit(:name, :picture)
    drummer = Drummer.new(drummer_params)
    drummer.save
    redirect_to drummer
    # redirect_to drummer_path(drummer)
    # redirect_to drummer_path(drummer.id)
  end

  def destroy
    drummer = Drummer.find(params[:id])
    drummer.destroy
  end


end
