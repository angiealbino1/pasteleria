class Usuario < ApplicationRecord
  has_secure_password

  has_many :carritos
  has_many :pedidos

  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true

  def admin?
    rol == "admin"
  end
end
