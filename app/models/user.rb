class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: "Test", foreign_key: :author_id, dependent: :destroy


  def show_tests_by_level(level)
    #Test.joins(:tests_users).where(tests: { level: level }).where(tests_users: { user_id: self.id })
    tests.where(level: level)
  end
end

