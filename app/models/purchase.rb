class Purchase < ApplicationRecord
	after_create :email_purchases

	def to_params
		uuid
	end

	def email_purchases
		Emailer.purchase_receipt(self).deliver!
	end
end
