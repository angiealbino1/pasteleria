class Carrito < ApplicationRecord
  belongs_to :producto
  belongs_to :usuario, optional:true
end
