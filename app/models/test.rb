class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  validates :title, presence: true, uniqueness:
  { scope: :level, message: "The name and level of the test are already in use" }

  validates :level, numericality: { only_integer: true }

  scope :level_easy, -> {where(level: 0..1)}
  scope :level_medium, -> {where(level: 2..4)}
  scope :level_hard, -> {where(level: 5..Float::INFINITY)}
  scope :show_tests_by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.show_title_by_category(category)
    show_tests_by_category(category).order(id: :desc).pluck('tests.title')
  end

end
