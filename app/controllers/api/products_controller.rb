class Api::ProductsController < Api::BaseController
  before_action :set_region

  def index
    @products = @region.products.all
    render jsonapi: @products
  end

  def create
    if current_user.role == 'admin'
      @product = @region.products.build(product_params)
      @product.save
      render_jsonapi_response(@product)
    else
      render_permission_denied
    end
  end

  def update
    if current_user.role == 'admin'
      @product = @region.products.find(params[:id])
      @product.update(product_params)
      render_jsonapi_response(@product)
    else
      render_permission_denied
    end
  end

  def destroy
    if current_user.role == 'admin'
      @product = @region.products.find(params[:id])
      @product.destroy
      render_jsonapi_response(@product)
    else
      render_permission_denied
    end
  end

  private

  def set_region
    @region = Region.find(params[:region_id])
  end

  def product_params
    params.require(:product).permit(:region_id, :title, :description, :image, :price, :sku, :stock_number)
  end
end
