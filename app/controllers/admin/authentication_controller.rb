class Admin::AuthenticationController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless session[:user_type] == "Admin"
      redirect_to login_path, alert: "No autorizado"
    end
  end
end
