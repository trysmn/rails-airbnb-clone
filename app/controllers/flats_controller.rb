class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  before_action :set_flat, only: [:show, :edit, :update, :delete]
  before_action :set_owner, only: [:show]
  def index
    @flats = Flat.all

    # @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
    #   marker.lat flat.latitude
    #   marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    # end
  end

  def search
    # @flats = Flat.where("search_params LIKE city")
    # @flats = Flat.where.not(latitude: nil, longitude: nil)
    @flats = Flat.where("lower(city) LIKE '%' || :city || '%' AND max_guests >= :guests", {city: params['search']['city'].downcase, guests: params['search']['guests']})

    @flats.each do |flat|
      if flat.latitude.nil?
        flat.latitude = flat.geocode[0]
        flat.longitude = flat.geocode[1]
        flat.save
      end
    end

    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    # @alert_message = "You are viewing #{@flat.title}"
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy!
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def set_owner
    @owner = Flat.find(params[:id]).user
  end

  def flat_params
    params.require(:flat).permit(:title, :address_line, :postal_code, :city, :country, :max_guests, :price, :description, pictures: [])
  end

  # def search_params
  #   params['search']['query']
  # end
end
