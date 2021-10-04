class Test < ApplicationRecord

  has_many :tests_user
  has_many :question
  has_one :category

  def self.show_tests_by_category(category)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category }).order(id: :desc).pluck(:title)
  end

end
