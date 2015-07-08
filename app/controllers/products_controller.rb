class ProductsController < ApplicationController
	def index
		@products = Product.all.includes(:category).published
	end
	
	def show
		@product = Product.find(params[:id])
	end
	
	def new
		@product = Product.new
	end

	def create
		@product = Product.create(product_params)
		if @product.save
			redirect_to products_url
		else
			render :new
		end	
	end

	private

	def product_params
		params.require(:product).permit( :title,
																		 :description,
																		 :price,
																		 :published,
																		 :category_id,
																		 :country_of_origin )
	end
end