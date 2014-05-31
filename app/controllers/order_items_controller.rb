class OrderItemsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :load_order

  def index
    @order_items = @order.order_items
    respond_with(@order_items)
  end

  def show
    @order_item = @order.order_items.find(params[:id])
    respond_with(@order_item)
  end

  def edit
    @order_item = @order.order_items.find(params[:id])
    respond_with(@order_item)
  end

  def new
    @order_item = @order.order_items.new
    respond_with(@order_item)
  end

  def create
    #fix, need to lookup the item and add fee/weight/subtract qty
    @order_item = @order.order_items.create(order_item_params)
    respond_with(@order, @order_item)
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    respond_with(@order, @order_item)
  end

  def destroy
    @order.order_items.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to order_order_items_path(@order) }
      format.json { render json: true }
    end
  end

  def order_item_params
    params.require(:order_item).permit(:item_id, :quantity)
  end

  def load_order
    @order = current_user.agency.orders.find(params[:order_id])
  end
end
