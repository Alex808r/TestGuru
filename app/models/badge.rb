class Badge < ApplicationRecord
  BADGES_RULES = %w[All_in_category On_first_try Certain_level].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :image_url, :rule, :parameter, presence: true
end
