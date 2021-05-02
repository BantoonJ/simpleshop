class Api::RegionsController < Api::BaseController
  def index
    @regions = Region.all
    render jsonapi: @regions
  end

  def create
    if current_user.role == 'admin'
      @region = Region.new(regions_params)
      @region.save
      render_jsonapi_response(@region)
    else
      render_permission_denied
    end
  end

  def update
    if current_user.role == 'admin'
      @region = Region.find(params[:id])
      @region.update(regions_params)
      render_jsonapi_response(@region)
    else
      render_permission_denied
    end
  end

  def destroy
    if current_user.role == 'admin'
      @region = Region.find(params[:id])
      @region.destroy
      render_jsonapi_response(@region)
    else
      render_permission_denied
    end
  end

  private

  def regions_params
    params.require(:region).permit(:title, :country, :currency, :tax)
  end
end
