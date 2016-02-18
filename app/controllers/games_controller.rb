class GamesController < ApplicationController
  before_action :set_game, only: [ :play, :check ]

  def welcome
  end
  def about
  end
  def play
    @lvl = 1
    @jocker = 1
  end
  def check
    lvl = params[:lvl].to_i
    jocker = params[:jocker].to_i
    drummer_id = params[:id].to_i
    drum_id = params[:drum]
    drum = Drum.find(drum_id)
    if jocker > 0
      @jocker = jocker
      render 'play'
    elsif drummer_id == drum.drummer_id
      lvl += 1
      @lvl = lvl.to_s
      flash.now[:notice] = "Well done !"
      render 'play'
    elsif drummer_id != drum.drummer_id
      @lvl = lvl.to_s
      @drum = drum
      flash.now[:alert] = "Miss..."
      render 'loose'
    else
      @lvl = "0"
      render 'play'
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
end
