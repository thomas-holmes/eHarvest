class ItemsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :require_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.for_agency(current_user.agency.id)
    respond_with(@items)
  end

  def show
    @item = Item.for_agency(current_user.agency.id).find(params[:id])
    respond_with(@item)
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
