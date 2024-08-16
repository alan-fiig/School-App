class StudentsController < ApplicationController
  before_action :require_student

  private

  def require_student
    unless session[:user_type] == "Student"
      redirect_to login_path, alert: "No autorizado"
    end
  end
end
