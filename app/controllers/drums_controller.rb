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
    @drum = @drummer.drums.build(drum_params)
    @drum.save
    redirect_to drums_path
  end

  def edit
    @drum = Drum.find(params[:id])
  end

  # def update
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

  private

  def drum_params
    params.require(:drum).permit(:drummer_id, :picture)
  end

  def find_drummer
    @drummer = Drummer.find(params[:id])
  end


end
