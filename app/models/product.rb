class Product < ActiveRecord::Base
	validate :title_is_shorter_than_description
	validates :price, numericality: { greater_than: 0 }, presence: true

	scope :published, -> { where(published: true) }
	scope :price_more_than, -> (price) { where('price > ?', price)}
	scope :description_includes, -> (text) { where('description LIKE ?', "%#{text}%") }

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if title.length >= description.length
			errors.add(:description, "can't be shorter than title")
		end
	end
end