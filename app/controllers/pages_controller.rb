class PagesController < ApplicationController
  def login
  end

  def create
    user = find_user_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = user.class.name
      redirect_to after_login_path_for(user)
    else
      redirect_to :login, flash: { error: 'Email o contraseña inválido.' }

    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to root_path, flash: { info: 'Sesión cerrada correctamente.' }
  end

  private

  def find_user_by_email(email)
    Admin.find_by(email: email) ||
    Teacher.find_by(email: email) ||
    Student.find_by(email: email)
  end

  def after_login_path_for(user)
    case user
      when Admin
        admin_dashboard_url
      when Teacher
        dashboard_admin_teachers_path
      when Student
        dashboard_admin_students_path
      else
        root_path
      end
  end
end
