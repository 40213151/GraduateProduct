class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @farmer = Farmer.all
     # 生徒の緯度経度から、近くの農家をしぼりだす
    # latitude = params[:latitude]
    # longitude = params[:longitude]
    # @places = Farmer.all.within(10, origin: [latitude, longitude])
  end
end