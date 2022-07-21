class PurchasesController < ApplicationController
	def show
		@purchase = Purchase.find_by_id(params[:id])
	end
end
