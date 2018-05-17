class ReservationsController < ApplicationController
  
  def index
      @reservations = current_student.reservations
  end
  
  def create
      @reservation = current_student.reservations.create(reservation_params)
      
      redirect_to @reservation.job ,notice:"お仕事を申し込みました"
  end

    private
        def reservation_params
            params.require(:reservation).permit(:date, :price_perhour, :total_price, :job_id)
        end
end