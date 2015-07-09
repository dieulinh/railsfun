module ProductsHelper
	def format_money(money)
		number_to_currency money, seperator: '.', delimiter: ',', unit: 'VND', format: '%u%n'
	end
end