class Teacher < ApplicationRecord
  has_one_attached :photo
  has_secure_password

  validates :photo, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :telephone, presence: true, format: { with: /\A\d{10}\z/, message: "Debe tener 10 dígitos" }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, message: "Debe tener al menos 6 caracteres" }
end