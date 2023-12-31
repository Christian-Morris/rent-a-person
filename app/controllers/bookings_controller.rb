class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @escort = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @escort = User.find(params[:user_id])
    @booking.escort = @escort
    @booking.renter = current_user
    if @booking.save
      @booking = Booking.find(@booking.id)
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update_status
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to bookings_path(tab: "engagements")
  end

  private

  def booking_params
    params.require(:booking).permit(:location, :date, :occasion_id, :status)
  end
end
