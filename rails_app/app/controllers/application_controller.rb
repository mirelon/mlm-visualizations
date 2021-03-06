class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        if resource.admin
          admin_root_path
        else
          members_dashboard_index_path
        end
      else
        super
      end
  end
end
