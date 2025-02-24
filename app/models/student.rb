class Student < ApplicationRecord
  has_one_attached :photo
  has_many :ratings
  has_many :subjects, through: :teacher_subjects, source: :subject
  has_many :teacher_subjects, through: :ratings
  has_secure_password

  #validates :photo, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :telephone, presence: true, format: { with: /\A\d{10}\z/, message: "Debe tener 10 dígitos" }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, message: "Debe tener al menos 6 caracteres" }
  validates :grade, presence: true, format: { with: /\A\d{1}\z/, message: "Ingresa el grado" }
  validates :group, presence: true, length: { maximum: 1, message: "Debe tener solo 1 grupo" }

  def enrolled_subjects
    TeacherSubject.where(grade: self.grade)
                  .where("`group` LIKE ?", "%#{self.group}%")
  end
end
