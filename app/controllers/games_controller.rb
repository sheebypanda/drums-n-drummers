class GamesController < ApplicationController
  attr_accessor :lvl, :drums

  def welcome
  end
  def about
  end
  def play
    lvlup(lvl)
    if lvl == 1
      set_drums
    else
      get_drums
    end
    @drummers = Drummer.where.not(id: drum.drummer_id).limit(2).order("RANDOM()")
    @drummers << drum.drummer
    @drummers = @drummers.shuffle
    render 'play'
  end
  def loose
      @drum = Drum.find(params[:drum])
      flash.now[:alert] = "Miss..."
      render 'loose'
  end
  def congrat
  end
  def check
    @lvl = params[:lvl].to_i
    drummer_id = params[:id].to_i
    drum = Drum.find(params[:drum])
    if @lvl == lvlmax
      render action: 'congrat' and return
    elsif drummer_id == drum.drummer_id
      flash.now[:notice] = "Well done !"
      play
    else drummer_id != drum.drummer_id
      loose
    end
  end

  private

  def lvlmax
    @lvlmax = drums.count
  end
  def set_drums
    cookies[:drums] = Drum.all.shuffle
  end
  def get_drums
    @drums = cookies[:drums]
  end
  def drum
    @drum = drums[lvl]
  end
  def drums
    @drums = cookies[:drums]
  end
  def lvlup(value)
    @lvl = 1 + value.to_i
  end

end
