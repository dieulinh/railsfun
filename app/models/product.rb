class Product < ActiveRecord::Base
	validate :title_is_shorter_than_description
	validates :price, numericality: true, greater_than: 0
	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if title.length >= description.length
			errors.add(:description, "cann't be shorter than title")
		end
	end
end