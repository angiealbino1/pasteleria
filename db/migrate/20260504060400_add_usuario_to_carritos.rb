class AddUsuarioToCarritos < ActiveRecord::Migration[8.1]
  def change
    add_reference :carritos, :usuario, null: true, foreign_key: true
  end
end
