class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests, dependent: :destroy

  scope :level_easy, -> {where(level: 0..1)}
  scope :level_medium, -> {where(level: 2..4)}
  scope :level_hard, -> {where(level: 5..Float::INFINITY)}

# default_scope {order(created_at: :desc)}

  #scope :easy, -> {where(level: 0..1).order(created_at: :desc)}
  #scope :easy, ->(level) {where(level: level).order(created_at: :desc)}

  # def self.easy(levl)
  #   where(level: levl)
  # end

  def self.show_tests_by_category(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck('tests.title')
  end

end
