class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(params.permit(:email, :password))
    resource.save
    sign_up(resource_name, resource) if resource.persisted?

    render_jsonapi_response(resource)
  end
end
