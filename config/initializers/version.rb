Version = '0.1.0'

# нужно ли поместить в модуль или в модуль и класс?

=begin
module TestGuru
  class Application
    Version = '0.1.0'
  end
end

или

module TestGuru
  Version = '0.1.0'
end

или

class TestGuru::Application
  Version = '0.1.0'
end

=end
