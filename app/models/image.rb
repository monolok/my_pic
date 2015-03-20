class Image < ActiveRecord::Base
	has_many :order_items
	has_many :tags

	accepts_nested_attributes_for :tags
  	#default_scope { where(active: true) }
	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
