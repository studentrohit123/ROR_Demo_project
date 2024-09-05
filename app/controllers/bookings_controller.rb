class BookingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]

  before_action :set_booking, only: [:show, :destroy]

  before_action :set_bookable, only: [:new, :create]

  def index
    if current_user
      @bookings = current_user.bookings
    else
      redirect_to new_user_session_path 
    end
  end

  def show
  end

  def new
    @available_seats = (1..@bookable.total_seats).to_a - @bookable.bookings.pluck(:seat_no)
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
  end
  
  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_bookable
    @bookable = if params[:bookable_type] == 'Bus'
                  Bus.find(params[:bookable_id])
                elsif params[:bookable_type] == 'Train'
                  Train.find(params[:bookable_id])
                end
  end
  
  def booking_params
    params.require(:booking).permit(:bookable_id, :bookable_type, :date, :seat_type, :seat_no, :name, :age, :gender)
  end
end
