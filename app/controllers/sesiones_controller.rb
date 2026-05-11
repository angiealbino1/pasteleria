class SesionesController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by(email: params[:email])

    if usuario && usuario.authenticate(params[:password])
      session[:usuario_id] = usuario.id

      if usuario.admin?
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      redirect_to login_path, alert: "Correo o contraseña incorrectos"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Sesión cerrada"
  end
end
