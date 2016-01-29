class DrumsController < ApplicationController
  before_action :find_drummer, only: [ :index, :create, :show, :edit, :update ]
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
    @drum = @drummer.drums.new(drum_params)
    @drum.save
    redirect_to edit_drummer_path(@drummer)
  end
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
    @drummer = Drummer.find(params[:drummer_id])
  end
end
