class PedidosController < ApplicationController
  before_action :requerir_login
  before_action :requerir_admin, only: [:admin, :actualizar_estado]

  # CLIENTE VE SUS PEDIDOS
  def index
    @pedidos = Pedido.where(usuario_id: usuario_actual.id)
  end

  # CREAR PEDIDO
  def create
    carritos = Carrito.where(usuario_id: usuario_actual.id)

    if carritos.empty?
      redirect_to carritos_path, alert: "Tu carrito está vacío"
      return
    end

    pedido = Pedido.create!(
      usuario_id: usuario_actual.id,
      total: 0,
      estado: "Pendiente"
    )

    total = 0

    carritos.each do |item|

      # VALIDAR STOCK
      if item.cantidad > item.producto.stock.to_i
        redirect_to carritos_path,
        alert: "No hay suficiente stock de #{item.producto.nombre}"
        return
      end

      # CREAR ITEM DEL PEDIDO
      PedidoItem.create!(
        pedido_id: pedido.id,
        producto_id: item.producto_id,
        cantidad: item.cantidad,
        precio: item.producto.precio
      )

      # DESCONTAR STOCK
      item.producto.update(
        stock: item.producto.stock - item.cantidad
      )

      total += item.producto.precio * item.cantidad
    end

    pedido.update(total: total)

    # LIMPIAR CARRITO
    carritos.destroy_all

    redirect_to pedidos_path,
    notice: "Pedido realizado 🎉"
  end

  # PANEL ADMIN
  def admin
    @pedidos = Pedido.includes(:usuario).all
  end

  # ACTUALIZAR ESTADO DEL PEDIDO
  def actualizar_estado
    pedido = Pedido.find(params[:id])

    pedido.update(
      estado: params[:estado]
    )

    redirect_to admin_pedidos_path,
    notice: "Estado actualizado correctamente"
  end
end
