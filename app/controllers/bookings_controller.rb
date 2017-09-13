class BookingsController < ApplicationController
  before_action :set_flat, only: [:show, :new, :create, :edit, :update, :delete]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    binding.pry
    @booking.flat = @flat
    @booking.user = @current_user
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
