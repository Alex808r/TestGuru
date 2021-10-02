class User < ApplicationRecord

  def show_tests_by_level(level)
    Test.where(level: level, author_id: self.id)
    # Test.where("level: :level, author_id: :id", level: level, id: self.id) # не работает
  end
end
