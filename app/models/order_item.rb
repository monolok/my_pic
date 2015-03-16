class OrderItem < ActiveRecord::Base
	belongs_to :image
	belongs_to :order

  	validate :image_present
  	validate :order_present

  	before_save :finalize

	def unit_price
		if persisted?
			self[:unit_price]
		else
			image.price
		end
	end

	def total_price
		unit_price
	end

private
	
	def image_present
		if image.nil?
			errors.add(:image, "is not valid or is not active")
		end
	end

	def order_present
		if order.nil?
      		errors.add(:order, "is not a valid order.")			
		end
	end

	def finalize
    	self[:unit_price] = unit_price
    	self[:total_price] = self[:unit_price]		
	end

end
