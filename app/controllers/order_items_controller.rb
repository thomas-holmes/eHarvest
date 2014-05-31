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
    ActiveRecord::Base.transaction do
      item = Item.find(order_item_params[:item_id])
      @order_item = @order.order_items.new(order_item_params)
      @order_item.fee = item.fee
      @order_item.weight = item.weight
      @order_item.save!
      item.quantity -= @order_item.quantity
      item.save!
    end

    respond_with(@order, @order_item)
  end

  def update
    @order_item = @order.order_items.find(params[:id])

    quantity_adjustment = @order_item.quantity - order_item_params[:quantity].to_i

    item = @order_item.item
    ActiveRecord::Base.transaction do
      @order_item.update(order_item_params)
      item.quantity += quantity_adjustment
      raise ActiveRecord::Rollback unless item.valid?
    end

    # Can't use respond to due to a bug in rails
    # https://github.com/rails/rails/issues/9069
    respond_to do |format|
      if @order_item.valid? && item.valid?
        format.html { render json: @order_item }
        format.json { render @order, @order_item }
      else
        format.html { render @order_item, status: :unprocessable_entity }
        format.json { render json: { message: 'Unprocessable entity' }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    order_item = @order.order_items.find(params[:id])
    item = order_item.item
    order_item.destroy
    item.quantity += order_item.quantity
    item.save!
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
