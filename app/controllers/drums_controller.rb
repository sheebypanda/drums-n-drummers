class DrumsController < ApplicationController

  def index
    @drums = Drum.all.order(updated_at: :desc)
  end

  def show
    @drum = Drum.find(params[:id])
    @drummer = Drummer.find(@drum[:id_drummer])
  end

  def new
    @drum = Drum.new
  end

  # def create
  #   drummer_params = params.require(:drummer).permit(:name, :picture)
  #   drummer = Drummer.new(drummer_params)
  #   drummer.save
  #   redirect_to drummers_path
  #   # redirect_to drummer_path(drummer)
  #   # redirect_to drummer_path(drummer.id)
  # end
  #
  # def edit
  #   @drummer = Drummer.find(params[:id])
  # end
  #
  # def update
  #   drummer_params = params.require(:drummer).permit(:name, :picture)
  #   drummer = Drummer.find(params[:id])
  #   drummer.update(drummer_params)
  #   redirect_to drummer_path
  # end
  #
  #
  # def destroy
  #   drummer = Drummer.find(params[:id])
  #   drummer.destroy
  #   redirect_to drummers_path
  # end


end
