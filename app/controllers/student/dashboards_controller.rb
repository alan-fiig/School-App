class Student::DashboardsController < Student::AuthenticationController
  def dashboard
    @student = current_user
    @student_subjects = @student.enrolled_subjects.includes(:teacher, :subject)
  end
end
