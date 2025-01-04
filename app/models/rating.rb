class Rating < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  belongs_to :subject
  belongs_to :teacher_subject

  validates :first_partial, :second_partial, :third_partial, numericality: true, allow_nil: true
end
