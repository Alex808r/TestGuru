# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private


  def welcome_flash
    flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}"
  end

  def after_sign_in_path_for(resource)
    welcome_flash
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
