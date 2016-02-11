class DrummersController < ApplicationController
  before_action :set_drummer, only: [ :edit, :update, :destroy ]
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_secret'], except: [:play, :check, :loose, :welcome]

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
    set_game
    @lvl = 1
  end
  def check
    set_game
    lvl = params[:lvl].to_i
    drummer_id = params[:id].to_i
    drum_id = params[:drum]
    drum = Drum.find(drum_id)
    if drummer_id == drum.drummer_id
      lvl += 1
      @lvl = lvl.to_s
      flash[:notice] = "Well done !"
      render 'play'
    else
      @lvl = lvl.to_s
      @drum = drum
      flash[:alert] = "Miss..."
      render 'loose'
    end
  end
  def loose
  end

  private

  def set_game
    @drum = Drum.limit(1).order("RANDOM()")
    @drummers = Drummer.where.not(id: @drum.first.drummer_id).limit(2).order("RANDOM()")
    @drummers << @drum.first.drummer
    @drummers = @drummers.shuffle
  end
  def set_drummer
    @drummer = Drummer.find(params[:id])
  end
  def drummer_params
    params.require(:drummer).permit(:name, :picture)
  end
end
