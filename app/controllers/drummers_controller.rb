class DrummersController < ApplicationController
  def index
    @drummers = Drummer.all
  end


end
