# frozen_string_literal: true

module Badges
  class PassTestByCategory < BadgeRuleSpecification
    def is_satiesfies?
      @category = Category.where(title: @value).first
      return false unless  @test_passage.test.category == @category
      Test.where(category: @category).size == passed_test_by_category.size
    end

    def passed_test_by_category
      Test
        .where(category: @category)
        .joins(:test_passages)
        .where(test_passages: { user: @test_passage.user, success: true })
        .distinct
    end
  end
end
