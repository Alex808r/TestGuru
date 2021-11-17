# frozen_string_literal: true

class Badge < ApplicationRecord

  enum rules: {
    first_test_passed: 'first_test_passed',
    pass_test_by_level: 'pass_test_by_level',
    pass_test_by_category: 'pass_test_by_category'
    }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :image_url, :rule, :parameter, presence: true

  def formatted_created_at
    created_at.strftime('%d-%m-%y %H:%M:%S')
  end
end
