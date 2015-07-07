class Product < ActiveRecord::Base
	validate :title_is_shorter_than_description
	validates :price, numericality: { greater_than: 0 }, presence: true
	before_validation :strip_html_from_description
	before_validation { |product| product.title.downcase! }

	scope :published, -> { where(published: true) }
	scope :price_more_than, -> (price) { where('price > ?', price)}
	scope :description_includes, -> (text) { where('description LIKE ?', "%#{text}%") }
	
	belongs_to :categogy

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if title.length >= description.length
			errors.add(:description, "can't be shorter than title")
		end
	end

	def strip_html_from_description
		self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
	end

end