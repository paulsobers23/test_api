class ApplicationController < ActionController::Base
  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 404
    end
  end
end
