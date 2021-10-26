# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Welcome back, #{current_user.name}"
      redirect_to_user_request
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'See you later!'
    redirect_to root_path
  end

  private

  def redirect_to_user_request
    redirect_to cookies.delete(:user_requested_path) || tests_path
  end
end
