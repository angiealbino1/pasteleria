class CarritosController < ApplicationController
  before_action :requerir_login

  def agregar
    @producto = Producto.find(params[:id])
	if @producto.stock.to_i <= 0
  redirect_to root_path, alert: "Producto agotado"
  return
end

    carrito = Carrito.find_or_initialize_by(
      producto_id: @producto.id,
      usuario_id: usuario_actual.id
    )

    carrito.cantidad ||= 0
    carrito.cantidad += 1
    carrito.save

    redirect_to root_path, notice: "Producto agregado al carrito 🛒"
  end

  def index
    @carritos = Carrito.includes(:producto).where(usuario_id: usuario_actual.id)

    @total = @carritos.sum do |item|
      item.producto.precio * item.cantidad
    end
  end

  def eliminar
    item = Carrito.where(usuario_id: usuario_actual.id).find(params[:id])
    item.destroy

    redirect_to carritos_path, notice: "Producto eliminado ❌"
  end
end
