class Subject < ApplicationRecord
  validates :name_subject, presence: true
  validates :grade, presence: true
  validates :group, presence: true
end
