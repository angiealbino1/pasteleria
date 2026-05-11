class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.rol = "cliente"

    if @usuario.save
      session[:usuario_id] = @usuario.id
      redirect_to root_path, notice: "Cuenta creada correctamente"
    else
      render :new
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation)
  end
end
