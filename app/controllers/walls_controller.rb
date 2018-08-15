class WallsController < ApplicationController
  before_action :set_wall, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_wall, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  
  # index before geocoding:
  # def index
  #   @walls = Wall.all
  #   policy_scope(Wall)
  # end

  def index
    @walls = Wall.where.not(latitude: nil, longitude: nil)
    @markers = @walls.map do |wall|
      {
        lat: wall.latitude,
        lng: wall.longitude#,
        # infoWindow: { content: render_to_string(partial: "/walls/map_box", locals: { wall: wall }) }
      }
    end
    policy_scope(Wall)
  end


  def show
    @booking = Booking.new

    @booking.wall = @wall
    @walls = [@wall]
    @markers = @walls.map do |wall|
      {
      lat: wall.latitude,
      lng: wall.longitude
      }
    end
    authorize @wall
  end

  def new
    @wall = Wall.new
    authorize @wall
  end

  def create
    @wall = Wall.new(wall_params)
    @wall.user = current_user
    authorize @wall
    if @wall.save
      redirect_to wall_path(@wall)
    else
      render :new
    end
  end

  def edit
    authorize @wall
  end

  def update
    authorize @wall
    @wall.update(wall_params)
    redirect_to wall_path(@wall)
  end

  def destroy
    authorize @wall
    @wall.bookings.destroy_all
    @wall.destroy
    redirect_to walls_path
  end

  private

  def set_wall
    @wall = Wall.find(params[:id])
  end

  def wall_params
    params.require(:wall).permit(:name, :address, :description, :photo, :photo_cache)
  end

  def authorize_wall
  end
end
