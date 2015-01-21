class ProductsController < ApplicationController
	
	def index
		@products = Product.all
	end

	 def create
     @product = Product.new(product_params)
    # params[:product][:status] = 'active'	
	   if @product.save
	    	redirect_to product_build_path(:id =>"add_name", :product_id => @product.id)
	  else
	    render :new
	  end
    #redirect_to wizard_path(wizard_steps.first, :product_id => @product.id)
  end

   # GET /courses/new
  def new
    @product = Product.new
  end

def product_params
      params.require(:product).permit(:name, :price, :category, :status, :description, :section_attributes => [:course_id, :section])
    end

end