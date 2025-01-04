class TeacherSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  has_many :ratings
  has_many :students, through: :ratings

  validates :teacher_id, uniqueness: { scope: :subject_id }
  validates :grade, :group, presence: true
end
