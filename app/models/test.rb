# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id           :bigint           not null, primary key
#  level        :integer          default(0), not null
#  passing_time :integer
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer          not null
#  category_id  :integer          not null
#
# Indexes
#
#  index_tests_on_author_id        (author_id)
#  index_tests_on_category_id      (category_id)
#  index_tests_on_title_and_level  (title,level) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness:
  { scope: :level, message: 'The name and level of the test are already in use' }

  validates :level, numericality: { only_integer: true }

  scope :level_easy, -> { where(level: 0..1) }
  scope :level_medium, -> { where(level: 2..4) }
  scope :level_hard, -> { where(level: 5..Float::INFINITY) }
  scope :show_tests_by_category, ->(category) { joins(:category).where(categories: { title: category }) }
  scope :by_level, ->(level) { where(level: level) }

  def self.show_title_by_category(category)
    show_tests_by_category(category).order(id: :desc).pluck('tests.title')
  end
end
