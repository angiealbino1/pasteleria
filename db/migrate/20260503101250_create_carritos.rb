class CreateCarritos < ActiveRecord::Migration[8.1]
  def change
    create_table :carritos do |t|
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
