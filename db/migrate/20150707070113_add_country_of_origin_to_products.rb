class AddCountryOfOriginToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :country_of_origin, :string
  end
end
