class CreatePedidoItems < ActiveRecord::Migration[8.1]
  def change
    create_table :pedido_items do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad
      t.float :precio

      t.timestamps
    end
  end
end
