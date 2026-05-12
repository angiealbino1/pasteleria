# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin = Usuario.find_or_initialize_by(email: "admin@admin.com")

admin.nombre = "Admin"
admin.password = "123456"
admin.password_confirmation = "123456"
admin.rol = "admin"

admin.save!

productos = [
  {
    nombre: "Pay de limón",
    precio: 45,
    descripcion: "Pay de limón con base de galleta y relleno cremoso.",
    imagen: "paydelimon.jpg",
    stock: 10
  },
  {
    nombre: "Pastel tres leches",
    precio: 70,
    descripcion: "Pastel suave bañado en tres leches con crema.",
    imagen: "pasteltresleches.jpg",
    stock: 10
  },
  {
    nombre: "Jericalla",
    precio: 35,
    descripcion: "Postre tradicional cremoso con toque caramelizado.",
    imagen: "jericalla.jpg",
    stock: 10
  },
  {
    nombre: "Fresas con crema",
    precio: 50,
    descripcion: "Fresas frescas con crema dulce.",
    imagen: "fresas.jpg",
    stock: 10
  }
]

productos.each do |datos|
  producto = Producto.find_or_initialize_by(nombre: datos[:nombre])

  producto.precio = datos[:precio]
  producto.descripcion = datos[:descripcion]
  producto.imagen = datos[:imagen]
  producto.stock = datos[:stock]

  producto.save!
end

puts "Admin y productos creados correctamente"
