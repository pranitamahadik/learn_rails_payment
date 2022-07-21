class ChargesController < ApplicationController
	def create
	  # Amount in cents
	  product = Product.find_by_id(params[:product_id])
	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })
	  charge = Stripe::PaymentIntent.create({
	    customer: customer.id,
	    amount: product.price_in_cents,
	    description: 'Rails Stripe customer',
	    currency: 'usd',
	  })
	  purchase = Purchase.create(
	  	email: params[:stripeEmail],
      	amount: product.price_in_cents,
      	description: charge.description,
      	currency: charge.currency,
      	customer_id: customer.id,
      	card: params[:stripeToken],
      	product_id: product.id,
      	uuid: SecureRandom.uuid
	  )

	  redirect_to purchase

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
