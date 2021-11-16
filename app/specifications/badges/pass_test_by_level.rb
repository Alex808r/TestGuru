# frozen_string_literal: true

module Badges
  class PassTestByLevel < BadgeRuleSpecification
    def is_satiesfies?
      @level = @value.to_i
      return false unless @test_passage.test.level == @level
      Test.where(level: @level).size == passed_test_by_level.size
    end

    def passed_test_by_level
      Test
        .where(level: @level)
        .joins(:test_passages)
        .where(test_passages: { user: @test_passage.user, success: true })
        .distinct
    end
  end
end
