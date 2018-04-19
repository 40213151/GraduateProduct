class ReviewsController < ApplicationController
   def create
       @review = current_farmer.reviews.create(review_params)
       redirect_to @review.student
   end
   
   def destroy
       @review = Review.find(params[:id])
       
       student = @review.student
       
       @review.destroy
       
       redirect_to student
   end
   
   private
   def review_params
       params.require(:review).permit(:description, :rate, :student_id)
   end
end