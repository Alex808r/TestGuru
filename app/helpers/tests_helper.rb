module TestsHelper
  TEST_LEVELS = {0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  # def test_level(test)
  #   case test.level
  #   when 0 then 'easy'
  #   when 1 then 'elementary'
  #   when 2 then 'advanced'
  #   when 3 then 'hard'
  #   else
  #     'hero'
  #   end
  # end
end
