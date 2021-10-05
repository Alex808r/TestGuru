class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: "Test", foreign_key: :author_id

  def show_tests_by_level(level)
    Test.joins('INNER JOIN tests_users ON tests_users.test_id = tests.id')
      .where(tests: { level: level })
      .where(tests_users: { user_id: self.id })
  end
end
