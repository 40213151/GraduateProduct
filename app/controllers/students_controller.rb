class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    
    @farmer = Farmer.all
    
    @reviews = @student.reviews
    
    @currentFarmerReview = @reviews.find_by(farmer_id: current_farmer.id) if current_farmer
  end
end