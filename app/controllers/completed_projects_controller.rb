class CompletedProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wall, only: [ :show, :new, :create]


  def show
    @completed_project = CompletedProject.find(params[:id])
    @markers = [@wall, ].map do |wall|
      {
      lat: wall.latitude,
      lng: wall.longitude
      }
    end
    authorize @wall
  end

  def new
    @completed_project = CompletedProject.new
    authorize @wall
  end

  def create
    @completed_project = CompletedProject.new(completed_params)
    @completed_project.wall = @wall

    if @completed_project.save
      redirect_to wall_completed_project_path(@wall, @completed_project)
    else
      render 'completed_projects/new'
    end
    authorize @wall

  end

  private

  def set_wall
    @wall = Wall.find(params[:wall_id])
  end

  def completed_params
    params.require(:completed_project).permit(:user_id, :name, :description, :collaborators, :photo, :photo_cache)
  end
end
