# frozen_string_literal: true

class Badge < ApplicationRecord
  # BADGES_RULES = %w[all_in_category on_first_try all_tests_by_level].freeze

  enum rules: [:all_in_category?, :on_first_try?, :all_tests_by_level?]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :image_url, :rule, :parameter, presence: true

  def formatted_created_at
    created_at.strftime('%d-%m-%y %H:%M:%S')
  end
end
