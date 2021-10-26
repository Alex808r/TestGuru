# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      flash[:info] = 'Authenticate please'
      cookies[:user_requested_path] = request.fullpath
      # render plain: params.to_yaml
      redirect_to login_path
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
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
