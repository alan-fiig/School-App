class Admin::TeacherSubjectsController < Admin::AuthenticationController
  before_action :set_teacher_subject, only: [:edit, :update, :destroy]

  def index
    @teacher_subjects = TeacherSubject.all
  end

  def new
    @teacher_subject = TeacherSubject.new
    @teacher_subject.teacher_id = Teacher.first.id if Teacher.any?
    @teacher_subject.subject_id = Subject.first.id if Subject.any?

  end

  def create
    @teacher_subject = TeacherSubject.new(teacher_subject_params)
    @teacher_subject.group = params[:teacher_subject][:group].join(', ')

    if @teacher_subject.save
      flash[:success] = 'Asignación agregado con éxito'
      redirect_to admin_teacher_subjects_path
    else
      flash[:error] = 'Error al agregar la asignación'
      render :new
    end
  end

  def update
    @teacher_subject.group = params[:teacher_subject][:group].join(', ')

    if @teacher_subject.update(teacher_subject_params)
      flash[:success] = 'Asignación actualizada con éxito'
      redirect_to admin_teacher_subjects_path
    else
      flash[:error] = 'Error al actualizar la asignación'
      render :new
    end
  end

  def destroy
    @teacher_subject.destroy
    flash[:success] = 'Asignación eliminada con éxito'
    redirect_to admin_teacher_subjects_path
  end

  private

  def set_teacher_subject
    @teacher_subject = TeacherSubject.find(params[:id])
  end

  def teacher_subject_params
    params.require(:teacher_subject).permit(:teacher_id, :subject_id, :grade, :group)
  end
end
