# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :destroy
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :title, presence: true, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex
end
