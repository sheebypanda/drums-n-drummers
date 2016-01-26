class DrumsController < ApplicationController

  def index
    @drums = Drum.all.order(updated_at: :desc)
  end

  def show
    @drum = Drum.find(params[:id])
    @drummer = Drummer.find(@drum.drummer_id)
  end

  def new
    @drum = Drum.new
  end

  def create
    drum_params = params.require(:drum).permit(:drummer_id, :picture)
    drum = Drum.create(drum_params)
    redirect_to drums_path
  end

  def edit
    @drum = Drum.find(params[:id])
  end

  # def update
  #   drummer_params = params.require(:drummer).permit(:name, :picture)
  #   drummer = Drummer.find(params[:id])
  #   drummer.update(drummer_params)
  #   redirect_to drummer_path
  # end
  #
  #
  def destroy
    drum = Drum.find(params[:id])
    drum.destroy
    redirect_to drums_path
  end


end
