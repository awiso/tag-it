class WallsController < ApplicationController
  before_action :set_wall, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  def index
    @walls = Wall.all
  end

  def show
  end

  def new
    @wall = Wall.new
  end

  def create
    @wall = Wall.new(wall_params)
    @wall.user = current_user
    if @wall.save
      redirect_to wall_path(@wall)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @wall.update(wall_params)
    redirect_to wall_path(@wall)
  end

  def destroy
    @wall.destroy
    redirect_to walls_path
  end

  private

  def set_wall
    @wall = Wall.find(params[:id])
  end

  def wall_params
    params.require(:wall).permit(:name, :address, :description, :photo)
  end
end
