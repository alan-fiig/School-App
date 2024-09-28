class Teacher::AuthenticationController < ApplicationController
  before_action :require_teacher

  private

  def require_teacher
    unless session[:user_type] == "Teacher"
      redirect_to login_path, alert: "No autorizado"
    end
  end
end
