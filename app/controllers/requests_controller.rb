class RequestsController < ApplicationController

  before_action :authenticate_user!
  def index
    policy_scope(Wall, policy_scope_class: RequestsPolicy::Scope)
    @walls = current_user.owned_walls
  end

end
