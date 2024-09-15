class Admin::StudentsController < Admin::AuthenticationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'Estudiante agregado con éxito'
      redirect_to admin_students_path
    else
      flash[:error] = 'Error al agregar estudiante'
      render :new
    end
  end

  def update
    if @student.update(student_params)
      flash[:success] = 'Estudiante actualizado con éxito'
      redirect_to admin_students_path
    else
      flash[:error] = 'Error al actualizar estudiante'
      render :edit
    end
  end

  def destroy
    @student.destroy
    flash[:success] = 'Estudiante eliminado con éxito'
    redirect_to admin_students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:photo, :name, :last_name, :birthdate, :telephone, :email, :password, :grade, :group)
  end
end
