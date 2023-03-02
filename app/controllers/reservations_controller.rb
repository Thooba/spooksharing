class ReservationsController < ApplicationController

  def show

  end

  def new
    @reservation = Reservation.new
    @book = Book.find(params[:book_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @book = Book.find(params[:book_id])
    @reservation.book = @book
    @reservation.user = current_user
    if @reservation.save!
      redirect_to reservation_path(@reservation)
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
