class CreatePedidos < ActiveRecord::Migration[8.1]
  def change
    create_table :pedidos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.float :total
      t.string :estado

      t.timestamps
    end
  end
end
