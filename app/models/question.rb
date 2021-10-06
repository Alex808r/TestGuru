class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
    # validates :answers, presence: true, length: { in: 1..4 } ошибка

end
