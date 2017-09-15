class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    @bookings = Booking.where("user_id = :c_user AND start_date >= :today", {c_user: current_user.id, today: Date.today }).order(:start_date)

    flats = []
    @bookings.each do |booking|
      flats << Flat.find(booking.flat_id)
    end

    @hash = Gmaps4rails.build_markers(flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name,:last_name,:profile_pic)
  end
end
