module TestsHelper
  def test_level(test)
    case test.level
    when 0 then 'easy'
    when 1 then 'elementary'
    when 2 then 'advanced'
    when 3 then 'hard'
    else
      'hero'
    end
  end
end
