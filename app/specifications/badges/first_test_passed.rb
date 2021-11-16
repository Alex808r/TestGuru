# frozen_string_literal: true

module Badges
  class FirstTestPassed < BadgeRuleSpecification
    def is_satiesfies?
      @title = @value
      user = @test_passage.user
      user.tests.where(title: @title).count == 1 if @test_passage.success?
    end
  end
end

