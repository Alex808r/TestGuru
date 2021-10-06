class Category < ApplicationRecord
  default_scope { order(title: :ASC )}

  has_many :tests, dependent: :destroy

end
