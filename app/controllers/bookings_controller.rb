class BookingsController < ApplicationController
  before_action :set_flat, only: [:index, :show, :new, :create, :edit, :update, :delete]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.total_price = days_between_booking * @flat.price
    if @booking.save
      redirect_to flat_booking_path(@flat, @booking)
    else
      render "flats/show"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to flat_booking_path(@flat, @booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy!
    redirect_to flat_bookings_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def days_between_booking
    params[:booking][:end_date].to_date - params[:booking][:start_date].to_date
  end
end
