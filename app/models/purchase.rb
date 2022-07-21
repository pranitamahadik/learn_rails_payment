class Purchase < ApplicationRecord
	def to_params
		uuid
	end
end
