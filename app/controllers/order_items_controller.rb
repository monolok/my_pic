class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    @image_in_cart = Image.find(@order_item.image_id)
    @image_in_cart.in_cart = true
    @image_in_cart.save

    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  # def update
  #   @order = current_order
  #   @order_item = @order.order_items.find(params[:id])
  #   @order_item.update_attributes(order_item_params)
  #   @order_items = @order.order_items
  # end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])

    @image_in_cart = Image.find(@order_item.image_id)
    @image_in_cart.in_cart = false
    @image_in_cart.save


    @order_item.destroy
    @order_items = @order.order_items


  end
private
  def order_item_params
    params.require(:order_item).permit(:image_id)
  end
end
