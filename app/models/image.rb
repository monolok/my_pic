class Image < ActiveRecord::Base
	has_many :order_items

  	#default_scope { where(active: true) }
	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
