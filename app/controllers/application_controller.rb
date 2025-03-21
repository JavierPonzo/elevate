class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  protected

  def configure_permitted_parameters
    # Permit additional parameters for sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :avatar, :role])

    # Permit additional parameters for account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :avatar, :role])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
