class DashboardsController < ApplicationController
  load_and_authorize_resource :class => false

  # GET /
  def index
  end
end
