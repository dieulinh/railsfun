class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update, :destroy]
	def index
		@products = Product.all.includes(:category).published
	end
	
	def show; end
	
	def new
		@product = Product.new
	end

	def edit
		render :new
	end

	def destroy
		if @product.destroy
			
			flash[:notice] = "Successfully delete product"
			redirect_to products_url
		else
			flash[:notice] = "There is an error when delete the product"
		end

	end

	def update
    if @product.update(product_params)
      redirect_to products_url
      flash[:notice] = "update successfully"
    else
      flash[:notice] = "There is an error when update product"
    end
	end

	def create
		@product = Product.create(product_params)
		if @product.save
			flash[:notice] = "You have successfully created the product"
			redirect_to products_url
		else
			flash[:notice] = "There is an error in you form"
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

	def find_product
		@product = Product.find(params[:id])
	end
end