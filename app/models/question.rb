class Question < ApplicationRecord
  belongs_to :test
  has_many :asnwer, dependent: :destroy
end
