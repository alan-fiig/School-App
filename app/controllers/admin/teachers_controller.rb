class Admin::TeachersController < Admin::AuthenticationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = 'Maestro agregado con éxito'
      redirect_to admin_teachers_path
    else
      flash[:error] = 'Error al agregar maestro'
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      flash[:success] = 'Maestro actualizado con éxito'
      redirect_to admin_teachers_path
    else
      flash[:error] = 'Error al actualizar maestro'
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    flash[:success] = 'Maestro eliminado con éxito'
    redirect_to admin_teachers_path
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:photo, :name, :last_name, :birthdate, :telephone, :email, :password)
  end
end
