class DrummersController < ApplicationController
  before_action :set_drummer, only: [ :show, :edit, :update, :destroy ]

  def index
    @drummers = Drummer.all.order(updated_at: :desc)
  end
  def show
  end
  def new
    @drummer = Drummer.new
  end
  def create
    @drummer = Drummer.new(drummer_params)
    if @drummer.save
      redirect_to drummer_path(@drummer)
    else
      render :new
    end
  end
  def edit
    @drum = Drum.new
  end
  def update
    @drummer.update(drummer_params)
    redirect_to drummers_path
  end
  def destroy
    @drummer.destroy
    redirect_to drummers_path
  end

  private

  def set_drummer
    @drummer = Drummer.find(params[:id])
  end
  def drummer_params
    params.require(:drummer).permit(:name, :picture)
  end
end
