class Emailer < ActionMailer::Base
	layout 'emailer'
	default from: "Learn Rails <pranitamahadik73@gmailcom>"

	def purchase_receipt(purchaes)
		@purchaes = purchaes
		mail to: purchaes.email
	end
end