class DrumsController < ApplicationController
  before_action :find_drummer, only: :create

  def create
    @drum = @drummer.drums.new(drum_params)
    @drum.save
    flash[:notice] = "Drum successfully assigned to  #{@drummer . name}"
    redirect_to edit_drummer_path(@drummer)
  end
  def destroy
    drum = Drum.find(params[:id])
    drum.destroy
    flash[:notice] = "Drum successfully deleted"
    redirect_to edit_drummer_path(drum.drummer)
  end

  private

  def drum_params
    params.require(:drum).permit(:drummer_id, :picture)
  end
  def find_drummer
    @drummer = Drummer.find(params[:drummer_id])
  end
end
