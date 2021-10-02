class Test < ApplicationRecord

  def self.show_tests_by_category(category)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = :category', category: category).order(id: :desc).pluck('tests.title')
  end

#    Test.joins(‘JOIN categories ON tests.category_id = categories.id’)

=begin
  SELECT tests.title, categories.title
  FROM tests INNER JOIN categories
  ON tests.categories_id=categories.id;
=end

end
