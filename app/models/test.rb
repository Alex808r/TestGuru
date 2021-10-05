class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests, dependent: :destroy


  def self.show_tests_by_category(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck('tests.title')
  end

end
