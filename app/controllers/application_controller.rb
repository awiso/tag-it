class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  before_action :new_wall
  # Uncomment when you *really understand* Pundit!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized(exception)

    flash[:alert] = "You are not authorized to perform this action."
    if @wall
      redirect_to wall_path(@wall)
    else
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    walls_path
  end

  def new_wall
    @new_wall = Wall.new

  end


  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
