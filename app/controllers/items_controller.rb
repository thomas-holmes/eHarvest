class ItemsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :require_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    @item = Item.find(params[:id])
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
