class LocationsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :require_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def show
    @location = Location.find(params[:id])
    respond_with(@location)
  end

  def edit
    raise 'Not implemented'
  end

  def new
    raise 'Not implemented'
  end

  def create
    raise 'Not implemented'
  end

  def update
    raise 'Not implemented'
  end

  def destroy
    raise 'Not implemented'
  end
end
