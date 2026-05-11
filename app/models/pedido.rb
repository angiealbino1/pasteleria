class Pedido < ApplicationRecord
  belongs_to :usuario
  has_many :pedido_items, dependent: :destroy

  validates :estado, presence: true
end
