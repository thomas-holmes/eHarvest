class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  def require_admin!
    respond_to do |format|
      format.json { render json: { status: 403, error: 'Forbidden'}, status: :forbidden }
      format.html { render :file => "public/403.html", status: :forbidden, layout: false }
    end
  end
end
