class AdminsController < ApplicationController
  before_action :require_admin
  before_action :set_teacher, only: [:show_teacher, :edit_teacher, :update_teacher, :delete_teacher]
  before_action :set_student, only: [:show_student, :edit_student, :update_student, :delete_student]
  before_action :set_subject, only: [:edit_subject, :update_subject, :delete_subject]

  # Teachers
  def teachers
    @teachers = Teacher.all
  end

  def new_teacher
    @teacher = Teacher.new
  end

  def create_teacher
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = 'Maestro agregado con éxito'
      redirect_to teachers_url
    else
      flash[:error] = 'Error al agregar maestro'
      render :new_teacher
    end
  end

  def update_teacher
    if @teacher.update(teacher_params)
      flash[:success] = 'Maestro actualizado con éxito'
      redirect_to teachers_url
    else
      flash[:error] = 'Error al actualizar maestro'
      render :edit_teacher
    end
  end

  def delete_teacher
    @teacher.destroy
    flash[:success] = 'Maestro eliminado con éxito'
    redirect_to teachers_url
  end

  # Students
  def students
    @students = Student.all
  end

  def new_student
    @student = Student.new
  end

  def create_student
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'Estudiante agregado con éxito'
      redirect_to students_url
    else
      flash[:error] = 'Error al agregar estudiante'
      render :new_student
    end
  end

  def update_student
    if @student.update(student_params)
      flash[:success] = 'Estudiante actualizado con éxito'
      redirect_to students_url
    else
      flash[:error] = 'Error al actualizar estudiante'
      render :edit_student
    end
  end

  def delete_student
    @student.destroy
    flash[:success] = 'Estudiante eliminado con éxito'
    redirect_to students_url
  end

  #Subjects
  def subjects
    @subjects = Subject.all
  end

  def new_subject
    @subject = Subject.new
  end

  def create_subject
    @subject = Subject.new(subject_params)
    @subject.group = params[:subject][:group].join(', ')
    if @subject.save
      flash[:success] = 'Materia agregado con éxito'
      redirect_to subjects_url
    else
      flash[:error] = 'Error al agregar materia'
      render :new_subject
    end
  end

  def update_subject
    @subject.group = params[:subject][:group].join(', ')
    if @subject.update(subject_params)
      flash[:success] = 'Materia actualizado con éxito'
      redirect_to subjects_url
    else
      flash[:error] = 'Error al actualizar materia'
      render :edit_subject
    end
  end

  def delete_subject
    @subject.destroy
    flash[:success] = 'Materia eliminada con éxito'
    redirect_to subjects_url
  end

  private

  def require_admin
    unless session[:user_type] == "Admin"
      redirect_to login_path, alert: "No autorizado"
    end
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:photo, :name, :last_name, :birthdate, :telephone, :email, :password)
  end

  def student_params
    params.require(:student).permit(:photo, :name, :last_name, :birthdate, :telephone, :email, :password, :grade, :group)
  end

  def subject_params
    params.require(:subject).permit(:name_subject, :grade, :group)
  end
end
