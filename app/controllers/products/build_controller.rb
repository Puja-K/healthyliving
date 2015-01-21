class Products::BuildController < ApplicationController
	include Wicked::Wizard

	steps :add_name, :add_price, :add_category

	def index
		@products = Product.all
	end

	def show
    @product = Product.find(params[:product_id])
    render_wizard
  end


  def update
    @product = Product.find(params[:product_id])
    params[:product][:status] = step.to_s
    params[:product][:status] = 'active' if step == steps.last
    @product.update_attributes(product_params)
    render_wizard @product
  end

 


  def create
    @product = Product.create
    redirect_to wizard_path(steps.first, :product_id => @product.id)
  end

 private
def product_params
      params.require(:product).permit(:name, :price, :category, :status, :description)
    end
  
end