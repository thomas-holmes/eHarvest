class OrdersController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def index
    @orders = current_user.agency.orders
    respond_with(@orders)
  end

  def show
    @order = current_user.agency.orders.find(params[:id])
    respond_with(@order)
  end

  def edit
    @order = current_user.agency.orders.find(params[:id])
    respond_with(@order)
  end

  def new
    @order = current_user.agency.orders.new
    respond_with(@order)
  end

  def create
    @order = current_user.agency.orders.create(order_params)
    binding.pry
    respond_with(@order)
  end

  def update
    @order = current_user.agency.orders.find(params[:id])
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    current_user.agency.orders.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to orders_path }
      format.json { render json: true }
    end
  end

  def order_params
    params.require(:order).permit(:requester, :recipient, :location_id, :delivery_date)
  end
end
