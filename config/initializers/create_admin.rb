Rails.application.config.after_initialize do
  begin
    if Rails.env.production?
      admin = Usuario.find_or_initialize_by(email: "admin@admin.com")

      admin.nombre = "Admin"
      admin.password = "123456"
      admin.password_confirmation = "123456"
      admin.rol = "admin"

      admin.save!
    end
  rescue => e
    Rails.logger.error "No se pudo crear admin: #{e.message}"
  end
end
