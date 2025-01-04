class Subject < ApplicationRecord
  has_many :teacher_subjects
  has_many :teachers, through: :teacher_subjects
  has_many :ratings

  validates :name_subject, presence: true, uniqueness: true
end
