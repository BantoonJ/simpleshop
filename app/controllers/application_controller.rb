class ApplicationController < ActionController::API
  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def render_permission_denied
    render json: {error: 'Permission denied', status: 101}
  end

end
