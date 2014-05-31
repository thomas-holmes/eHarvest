class ItemCodesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :require_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @item_codes = ItemCode.all
    respond_with(@item_codes)
  end

  def show
    @item_code = ItemCode.find(params[:id])
    respond_with(@item_code)
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
