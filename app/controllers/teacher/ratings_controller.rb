class Teacher::RatingsController < Teacher::AuthenticationController
  before_action :set_teacher_subject

  def index
    @teacher = current_user
    @teacher_subjects = @teacher.teacher_subjects.includes(:subject)
    @subject = @teacher_subjects.first.subject if @teacher_subjects.any?

    grades = @teacher_subjects.pluck(:grade).uniq
    groups = @teacher_subjects.pluck(:group).flat_map { |g| g.split(',').map(&:strip) }.uniq

    @students = Student.where(grade: grades, group: groups)
  end

  def new
    @rating = Rating.new
  end

  def create
    rating_params.each do |rating_data|
      rating_data[:first_partial] = nil if rating_data[:first_partial].blank?
      rating_data[:second_partial] = nil if rating_data[:second_partial].blank?
      rating_data[:third_partial] = nil if rating_data[:third_partial].blank?

      rating = Rating.new(rating_data)
      if rating.save
        flash[:success] = 'Estudiante agregado con éxito'
        redirect_to teacher_ratings_path
      else
        flash[:error] = 'Error al guardar las calificaciones'
        render :index
      end
    end
  end

  private

  def set_teacher_subject
    @teacher_subject = TeacherSubject.find_by(teacher: current_user, subject_id: params[:subject_id])
  end

  def rating_params
    params.require(:ratings).map do |rating|
      rating.permit(:student_id, :teacher_subject_id, :first_partial, :second_partial, :third_partial).tap do |p|
        p[:first_partial] = p[:first_partial].to_f if p[:first_partial].present?
        p[:second_partial] = p[:second_partial].to_f if p[:second_partial].present?
        p[:third_partial] = p[:third_partial].to_f if p[:third_partial].present?
      end
    end
  end

end
