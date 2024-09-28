class TeacherSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject

  validates :teacher_id, uniqueness: { scope: :subject_id }
  validates :grade, :group, presence: true
end
