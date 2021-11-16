# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.badges.order(created_at: :desc)
  end
end
