class GamesController < ApplicationController
  attr_accessor :lvl, :drums

  def welcome
  end
  def about
  end
  def play
    lvlup(lvl)
    # unless lvl >= 2
      set_drums
    # end
    @drummers = Drummer.where.not(id: drum.drummer_id).limit(2).order("RANDOM()")
    @drummers << drum.drummer
    @drummers = @drummers.shuffle
    render 'play'
  end
  def loose
      @lvl = @lvl.to_s
      @drum = Drum.find(params[:drum])
      flash.now[:alert] = "Miss..."
      render 'loose'
  end
  def check
    @lvl = params[:lvl]
    drummer_id = params[:id].to_i
    drum = Drum.find(params[:drum])
    if drummer_id == drum.drummer_id
      well_done
      play
    else drummer_id != drum.drummer_id
      loose
    end
  end

  private

  def set_drums
    @drums = Drum.all
  end
  def drums
    @drums
  end
  def drum
    @drum = drums[lvl]
  end
  def lvlup(value)
    @lvl = 1 + value.to_i
  end
  def well_done
    flash.now[:notice] = "Well done !"
  end

end
