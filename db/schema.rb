# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_07_035327) do
  create_table "carritos", force: :cascade do |t|
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.integer "producto_id", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.index ["producto_id"], name: "index_carritos_on_producto_id"
    t.index ["usuario_id"], name: "index_carritos_on_usuario_id"
  end

  create_table "pedido_items", force: :cascade do |t|
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.integer "pedido_id", null: false
    t.float "precio"
    t.integer "producto_id", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_pedido_items_on_pedido_id"
    t.index ["producto_id"], name: "index_pedido_items_on_producto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "estado"
    t.float "total"
    t.datetime "updated_at", null: false
    t.integer "usuario_id", null: false
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "productos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "descripcion"
    t.string "imagen"
    t.string "nombre"
    t.decimal "precio"
    t.integer "stock"
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "nombre"
    t.string "password_digest"
    t.string "rol"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carritos", "productos"
  add_foreign_key "carritos", "usuarios"
  add_foreign_key "pedido_items", "pedidos"
  add_foreign_key "pedido_items", "productos"
  add_foreign_key "pedidos", "usuarios"
end
