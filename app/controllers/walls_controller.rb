class WallsController < ApplicationController
  before_action :set_wall, only: [ :show ]
  def index
    @walls = Wall.all
  end

  def show
  end

  private

  def set_wall
    @wall = Wall.find(params[:id])
  end

  def wall_params
    params.require(:wall).permit(:name, :address, :description, :photo)
  end
end
