class FarmersController < ApplicationController
  before_action :set_farmer, only: [:show, :jobs, :blogs]
  
  def show
    @jobs = Job.limit(3)
    @blogs = Blog.limit(3)
  end
  
  def jobs
  end
  
  def jobs
  end

  private
  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

end