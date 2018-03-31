class PagesController < ApplicationController
  def index
  end
  
  def search
    if params[:search].present?
      
      @latitude = params["lat"]
      @longitude = params["lng"]
      geolocation = [@latitude,@longitude]
      
      @jobs = Job.near(geolocation, 1, order: 'distance')
      
    # 検索欄が空欄の場合
    else

      @jobs = Job.all
      @latitude = @jobs.to_a[0].latitude
      @longitude = @jobs.to_a[0].longitude  

    end
  end
end
