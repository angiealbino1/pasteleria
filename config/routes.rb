Rails.application.routes.draw do
  root "productos#index"

  resources :productos

  resources :carritos, only: [:index]
  post "carrito/agregar/:id", to: "carritos#agregar", as: "agregar_carrito"
  delete "carrito/eliminar/:id", to: "carritos#eliminar", as: "eliminar_carrito"

  resources :pedidos, only: [:index, :create]
  post "checkout", to: "pedidos#create", as: "checkout"

  get "admin/pedidos", to: "pedidos#admin", as: "admin_pedidos"
  patch "admin/pedidos/:id", to: "pedidos#actualizar_estado", as: "actualizar_pedido"

  get "login", to: "sesiones#new"
  post "login", to: "sesiones#create"
  delete "logout", to: "sesiones#destroy"

  get "registro", to: "usuarios#new"
  post "registro", to: "usuarios#create"
end
