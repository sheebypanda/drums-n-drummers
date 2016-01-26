class DrummersController < ApplicationController

  def index
    @drummers = Drummer.all.order(updated_at: :desc)
  end

  def show
    @drummer = Drummer.find(params[:id])
  end

  def new
    @drummer = Drummer.new
    @drum = Drum.new
  end

  def create
    drummer_params = params.require(:drummer).permit(:name, :picture)
    @drummer = Drummer.create(drummer_params)
    redirect_to drummers_path
    # redirect_to drummer_path(drummer)
    # redirect_to drummer_path(drummer.id)
  end

  def edit
    @drummer = Drummer.find(params[:id])
    @drums = Drum.find_by(drummer_id: params[:id])
    @drum  = Drum.new
  end

  def update
    drummer_params = params.require(:drummer).permit(:name, :picture)
    drummer = Drummer.find(params[:id])
    drummer.update(drummer_params)
    redirect_to drummer_path
  end


  def destroy
    drummer = Drummer.find(params[:id])
    drummer.destroy
    redirect_to drummers_path
  end

end
