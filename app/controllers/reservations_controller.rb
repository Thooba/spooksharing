class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.book = @book
    if @reservation.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to book_path(reservation.book)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_start, :reservation_end, :user_id, :book_id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
