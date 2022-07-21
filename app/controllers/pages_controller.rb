class PagesController < ApplicationController
	def home
		@product = Product.find_by_sku("KittyOne")
	end
end