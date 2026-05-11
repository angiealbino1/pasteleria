class ApplicationController < ActionController::Base
  helper_method :usuario_actual, :sesion_iniciada?, :admin?

  def usuario_actual
    @usuario_actual ||= Usuario.find_by(id: session[:usuario_id])
  end

  def sesion_iniciada?
    usuario_actual.present?
  end

  def admin?
    usuario_actual&.admin?
  end

  def requerir_login
    unless sesion_iniciada?
      redirect_to login_path, alert: "Debes iniciar sesión"
    end
  end

  def requerir_admin
    unless admin?
      redirect_to root_path, alert: "No tienes permisos de administrador"
    end
  end
end
