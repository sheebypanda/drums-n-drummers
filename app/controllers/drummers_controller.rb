class DrummersController < ApplicationController
  before_action :set_drummer, only: [ :edit, :update, :destroy ]
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_secret'], except: [:play, :welcome]

  def index
    @drummers = Drummer.all.order(updated_at: :desc)
  end
  def new
    @drummer = Drummer.new
  end
  def create
    @drummer = Drummer.new(drummer_params)
    if @drummer.save
      flash[:notice] = "Drummer #{@drummer . name} has been successfully created"
      redirect_to edit_drummer_path(@drummer)
    else
      flash[:alert] = "Error : Drummer not created"
      render :new
    end
  end
  def edit
    @drum = Drum.new
    @drums = @drummer.drums
  end
  def update
    @drummer.update(drummer_params)
    flash[:notice] = "Drummer #{@drummer . name} has been successfully updated"
    redirect_to drummers_path
  end
  def destroy
    @drummer.destroy
    flash[:notice] = "Drummer #{@drummer . name} has been successfully deleted"
    redirect_to drummers_path
  end
  def welcome
  end
  def play
    @drum = Drum.limit(1).order("RANDOM()")
    @drummers = Drummer.where.not(id: @drum.first.drummer_id).limit(2).order("RANDOM()")
    @drummers << @drum.first.drummer
    @drummers = @drummers.shuffle
    @lvl = 0
  end
  def check
    redirect_to '/play'
  end

  private

  def set_drummer
    @drummer = Drummer.find(params[:id])
  end
  def drummer_params
    params.require(:drummer).permit(:name, :picture)
  end
end
