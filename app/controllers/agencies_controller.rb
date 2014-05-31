class AgenciesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def show
    @agency = current_user.agency
    respond_with(@agency)
  end
end
