class AgencyCodesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :require_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @agency_codes = AgencyCode.all
    respond_with(@agency_codes)
  end

  def show
    @agency_code = AgencyCode.find(params[:id])
    respond_with(@agency_code)
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
