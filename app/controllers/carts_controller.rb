class CartsController < ApplicationController

  def show
  	@order_items = current_order.order_items
  end

  # def new_payment
  	
  # end

  def create_payment
	# Amount in cents
	@amount = current_order.subtotal
	@amount = @amount * 100
	@amount = @amount.round

	customer = Stripe::Customer.create(
	:email => 'example@stripe.com',
	:card  => params[:stripeToken]
	)

	charge = Stripe::Charge.create(
	:customer    => customer.id,
	:amount      => @amount,
	:description => 'Rails Stripe customer',
	:currency    => 'usd'
	)

#Empty cart

    @order = current_order
    @order.order_items.each do |oi|
    	oi.image.update(in_cart: false)
    	oi.image.update(active: false)
    	oi.image.update(e_mail: params[:stripeEmail])
    	oi.destroy
    end

#checking for errors
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to carts_path


   end


end
