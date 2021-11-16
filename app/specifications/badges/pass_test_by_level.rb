# frozen_string_literal: true

module Badges
  class PassTestByLevel < BadgeRuleSpecification
    def is_satiesfies?
      @level = @value
      return false unless @test_passage.test.level == @level
      @test_ids = Test.where(level: @level).ids
      @test_ids.size == count_tests_success(@test_ids)
    end

    def count_tests_success(test_ids)
      @user = @test_passage.user
      @user.test_passages.where(test_id: test_ids).successfull.uniq.count
    end
  end
end
