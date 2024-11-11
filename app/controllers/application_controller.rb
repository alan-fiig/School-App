class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= begin
      case session[:user_type]
      when 'Admin'
        Admin.find_by(id: session[:user_id])
      when 'Teacher'
        Teacher.find_by(id: session[:user_id])
      when 'Student'
        Student.find_by(id: session[:user_id])
      end
    end
  end

  def logged_in?
    current_user.present?
  end
end
