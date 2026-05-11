Rails.application.routes.draw do
  resources :productos
  resources :carritos, only: [:index]

  post "carrito/agregar/:id", to: "carritos#agregar", as: "agregar_carrito"

  root "productos#index"
end
