class User < ApplicationRecord
  has_many :tests_user


  def show_tests_by_level(level)
    Test.joins('INNER JOIN tests_users ON tests_users.test_id = tests.id')
      .where(tests: { level: level })
      .where(tests_users: { user_id: self.id })
  end
end
