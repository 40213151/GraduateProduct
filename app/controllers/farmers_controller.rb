class FarmersController < ApplicationController
  def show
    @farmer = Farmer.find(params[:id])
  end
  
  def jobs
    @farmer = Farmer.find(params[:id])
  end

end