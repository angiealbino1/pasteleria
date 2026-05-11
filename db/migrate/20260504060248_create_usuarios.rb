class CreateUsuarios < ActiveRecord::Migration[8.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :password_digest
      t.string :rol

      t.timestamps
    end
  end
end
