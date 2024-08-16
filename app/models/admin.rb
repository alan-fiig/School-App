class Admin < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, message: "Debe tener al menos 6 caracteres" }
end
