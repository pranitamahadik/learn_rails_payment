class PurchasesController < ApplicationController
	def show
		@purchase = Purchase.find_by_id(params[:id])
		@product = Product.find_by(id: @purchase.product_id)
	end
end
