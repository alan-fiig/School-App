class Admin::SubjectsController < Admin::AuthenticationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.group = params[:subject][:group].join(', ')
    if @subject.save
      flash[:success] = 'Materia agregado con éxito'
      redirect_to admin_subjects_path
    else
      flash[:error] = 'Error al agregar materia'
      render :new
    end
  end

  def update
    @subject.group = params[:subject][:group].join(', ')
    if @subject.update(subject_params)
      flash[:success] = 'Materia actualizado con éxito'
      redirect_to admin_subjects_path
    else
      flash[:error] = 'Error al actualizar materia'
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = 'Materia eliminada con éxito'
    redirect_to admin_subjects_path
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name_subject, :grade, :group)
  end
end
