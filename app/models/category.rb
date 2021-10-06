class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

    default_scope { order(title: :ASC )}
end
