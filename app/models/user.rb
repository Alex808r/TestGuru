class User < ApplicationRecord
  #has_many :tests_users, dependent: :destroy
  #has_many :tests, through: :tests_users

  has_many :test_passages,dependent: :destroy
  has_many :tests,through: :test_passages

  has_many :author_tests, class_name: "Test", foreign_key: :author_id, dependent: :destroy

  validates :name, :email, presence: true

  def show_tests_by_level(level)
    tests.where(level: level)
  end

end

