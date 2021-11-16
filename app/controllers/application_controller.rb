# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name first_name last_name])
  end

  def require_no_authentication
    return unless logged_in?

    flash[:alert] = 'You are already signed in!'
    redirect_to root_path
  end

  def require_authentication
    return if logged_in?

    flash[:alert] = 'You are not signed in!'
    redirect_to root_path
  end
  
end
