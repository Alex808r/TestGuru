# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('shared.message.hello', user_first_name: current_user.first_name)
    # flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}"
  end
end
