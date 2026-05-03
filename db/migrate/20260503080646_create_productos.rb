class CreateProductos < ActiveRecord::Migration[8.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.decimal :precio
      t.text :descripcion
      t.string :imagen

      t.timestamps
    end
  end
end
