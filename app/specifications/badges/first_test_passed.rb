# frozen_string_literal: true

module Badges
  class FirstTestPassed < BadgeRuleSpecification
    def is_satiesfies?
      return false unless @test_passage.success?
      @title = @value
      user = @test_passage.user
      user.tests.where(title: @title).count == 1
    end
  end
end

