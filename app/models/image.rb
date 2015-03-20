class Image < ActiveRecord::Base
	has_many :order_items
	has_many :tags

	accepts_nested_attributes_for :tags, allow_destroy: true
  	#default_scope { where(active: true) }
	def self.search(query)
		tags = Tag.all
		@tag_arr = Array.new
		tags.each do |tag|
			if tag.name == query
				@tag_arr.push(tag.image_id)
			end
		end
		where("name like ?", "%#{query}%")
		find(@tag_arr)
	end
end
