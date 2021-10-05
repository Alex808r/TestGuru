class Test < ApplicationRecord
  belongs_to :category

  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id


  def self.show_tests_by_category(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck('tests.title')
  end

  # def self.show_tests_by_category(category)
  #   joins('INNER JOIN categories ON tests.category_id = categories.id')
  #     .where(categories: { title: category }).order(id: :desc).pluck(:title)
  # end



end
