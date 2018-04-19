class PagesController < ApplicationController
  def index #views/index.html.erbを表示させるというアクション
    @jobs = Job.limit(3)
    @blogs = Blog.limit(3)
  end

  def search
    if params[:search].present?
      
      @latitude = params["lat"]
      @longitude = params["lng"]

      geolocation = [@latitude,@longitude]

      @jobs= Job.near(geolocation, 1, order: 'distance')

    # 検索欄が空欄の場合
    else

      @jobs = Job.all
      @latitude = @jobs.to_a[0].latitude
      @longitude = @jobs.to_a[0].longitude  

    end
    
     #リスティングデータを配列にしてまとめる 
    @arrjobs = @jobs.to_a
    
  end
  
   def ajaxsearch
    
      # まずajaxで送られてきた緯度経度をセッションに入れる
      if !params[:geolocation].blank?
        geolocation = params[:geolocation]
      end
  
      @jobs = Job.near(geolocation, 1, order: 'distance')
  
      #リスティングデータを配列にしてまとめる 
      @arrjobs = @jobs.to_a
  
      respond_to :js
  
   end
end
